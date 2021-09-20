class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "Correct password entered"
    else
      render plain: "Incorrect password entered"
    end
  end
end
