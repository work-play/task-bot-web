class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = User.find(params[:user_id]).tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @tasks = current_user.tasks
  end

  def create
    title, goaldate = process_taskinput(params[:task])
    @new_task = current_user.tasks.create(title: title)
    @goal_date = @new_task.goal_dates.create(date:goaldate.to_date)
    redirect_to root_path, flash: {notice: "Successfully created a new task."}
  end

  private
  def process_taskinput(task)
    matched = task.match(/(.+)_(.+)/)
    return matched[1], matched[2]
  end
end
