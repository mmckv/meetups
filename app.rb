require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"
  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."
  redirect '/'
end

#Links to Page with Form
get '/meetups/new' do
  @add_event = params
  erb :'meetups/new'
end

post '/meetups/new' do
  unless params[:name].strip.empty? || params[:description].strip.empty? || params[:location].strip.empty?
    @event = Event.create(name: params[:name], location: params[:location], description: params[:description], user_id: current_user.id)
    UsersEvent.create(user: current_user, event: @event)
    redirect '/'
  end
  @add_event = params
    erb :'meetups/new'
end

get "/meetups/:id" do
  @event = Event.find(params[:id])
  @users = User.all
  erb :'meetups/show'
end

post "/meetups/:id" do
  current_user
  @event = Event.find(params[:id])
  @users = User.all
  @u_e = UsersEvent.find_by(user: current_user, event: @event)
  if current_user.nil?
    flash[:notice] = "You must be signed in to join meetup!"
    redirect "/meetups/#{params[:id]}"
  elsif !@u_e.nil?
    flash[:notice] = "You are already included in the meetup!"
    redirect "/meetups/#{params[:id]}"
  else
    UsersEvent.create(user: current_user, event: @event)
    flash[:notice] = "Congrats, you are now included in the meetup!"
    redirect "/meetups/#{params[:id]}"
  end
  erb :'meetups/show'
end

#Redirects back to Index
get '/meetups' do
  @meetups = Event.all.order(name: :asc)
  erb :'meetups/index'
end
