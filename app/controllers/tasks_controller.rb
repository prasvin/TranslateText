class TasksController < ApplicationController

  def index
  end

  def show
    @task = current_user.tasks.find(params[:id])
    @microtasks = @task.microtasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      flash[:notice] = "New Task '#{@task.title}' Created"
      redirect_to user_root_path
    else
      render 'new'
    end
  end

end