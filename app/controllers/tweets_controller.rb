class TweetsController < ApplicationController
  enable :sessions

  get '/tweets' do
    if logged_in?(session)
      erb :'/tweets/tweets'
    else
      redirect '/login'
    end
  end

 


end
