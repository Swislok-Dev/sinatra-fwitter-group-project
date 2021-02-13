module Helpers

  def current_user(session)
    if session[:id] != nil
      User.find(session[:id])
    end
  end

  def logged_in?(session)

    !!session[:id]

    # if session[:id] != nil
    #   user_id = current_user(session).id
    #   session[:id] == user_id ? true : false
    # end
  end

end
