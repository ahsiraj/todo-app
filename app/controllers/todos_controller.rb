# todos_conntroller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #@todos = Todo.where(user_id: current_user.id) --first
    #@todos = Todo.of_user(current_user) --second
    # Now simpler
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    #render plain: todo.to_pleasant_string
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    user_id = current_user.id
    new_todo = Todo.create!(todo_text: todo_text,
                            due_date: due_date, completed: false, user_id: user_id)
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
