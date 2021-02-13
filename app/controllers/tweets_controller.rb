

class TweetsController < ApplicationController
  include Helpers
  
  enable :sessions
  enable :method_override


  get '/tweets' do
    if logged_in?(session)
      @user = current_user(session)
      @tweets = Tweet.all
      @users = User.all
    else
      redirect '/login'
    end
    erb :'tweets/tweets'
  end

  get '/tweets/new' do
    if logged_in?(session)
      erb :'tweets/new'
    else
      redirect '/login'
    end
  end

 


end
