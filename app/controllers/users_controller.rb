#users_conntroller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: first_name, last_name: last_name,
                            email: email, password: password)
    #response_text = "The new user is created with the id #{new_user.id}"
    #render plain: response_text
    redirect_to "/users/new"
    return
  end
end
