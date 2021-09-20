class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    #@current_user_id = session[:current_user_id]
    if current_user
      redirect_to todos_path
      #render "index", locals: { user_name: current_user.first_name }
    else
      render "index"
    end
  end
end
