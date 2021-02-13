class UsersController < ApplicationController

  get '/users/:slugs' do
    @user = User.find_by_slug(params[:slug])
    @tweets = @user.tweets

    erb :'users/show'
  end

end
