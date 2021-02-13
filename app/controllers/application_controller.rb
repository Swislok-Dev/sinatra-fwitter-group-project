require './config/environment'

class ApplicationController < Sinatra::Base
  include Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    
    set :session_secret, "password_security"
  end

  enable :sessions
  # enable :method_override

  get '/' do
    erb :index
  end

  get '/signup' do
    if logged_in?(session)
      redirect "/tweets"
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)

    if @user.username == "" || @user.email == "" || @user.password == ""
      redirect "/signup"
    elsif @user.save
      session[:id] = @user.id
      redirect "/tweets"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    if logged_in?(session)
      current_user(session)
      redirect "/tweets"
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])

    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/tweets"
    else
      redirect "/login"
    end
  end

  get '/logout' do 
    if logged_in?(session)
      session.clear
    end
    redirect '/login'
  end



end
