class TweetsController < ApplicationController
  enable :sessions

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

  get '/new' do
    erb :'/tweets/new'
  end

 


end
