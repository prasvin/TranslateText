class TasksController < ApplicationController

  def index
  end

  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      @task.build_microtasks
      flash[:notice] = "New Task '#{@task.title}' Created"
      redirect_to user_root_path
    else
      render 'new'
    end
  end

end