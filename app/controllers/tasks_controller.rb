class TasksController < ApplicationController

  def index
  end

  def show
    @task = Task.find(params[:id])
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

  def translate_microtask
    @microtask = Microtask.find(params[:id])
    @microtask.translator = current_user
    @microtask.status = "Processing"
    @microtask.save
  end

  def update_microtask
    @microtask = Microtask.find(params[:id])
    @microtask.translated_paragraph = params[:translated_paragraph]
    @microtask.status = "Submitted"
    @microtask.translator = current_user
    if @microtask.save
      flash[:notice] = "The task has been translated"
      redirect_to user_root_path
    end
  end
end