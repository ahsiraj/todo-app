# todos_conntroller.rb
class UsersController < ApplicationController
  #skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    response_text = user.to_pleasant_string
    render plain: response_text
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    #password_digest = digest(params[:password])
    new_user = User.create!(first_name: first_name, last_name: last_name,
                            email: email) #o, password_digest: password_digest)
    #response_text = "The new user is created with the id #{new_user.id}"
    #render plain: response_text
    redirect_to "/users/new"
    return
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    render plain: user.present?
  end
end
