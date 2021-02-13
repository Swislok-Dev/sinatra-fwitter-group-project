require './config/environment'

class ApplicationController < Sinatra::Base
  include Helpers

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "password_security"
  end

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

end
