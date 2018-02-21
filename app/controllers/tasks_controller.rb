class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = User.find(params[:user_id]).tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
  end

  def create
    @new_task = current_user.tasks.create(title: params[:title])
    redirect_to root_url, flash: {notice: "Successfully created a new task."}
  end

  private
  def owner_only!
    if current_user.id != params[:id]
      redirect_to root, alert: "Only owners can create a new task."
    end
  end
end
