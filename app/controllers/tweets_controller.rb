require 'rack-flash'
class TweetsController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/tweets' do
    if logged_in?(session)
      erb :'/tweets/tweets'
    else
      env['x-rack.flash'].notice = "You must to logged in to view Tweets!!"
      redirect '/login'
    end
  end

 


end
