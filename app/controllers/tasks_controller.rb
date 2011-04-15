class TasksController < ApplicationController

  before_filter :authenticate_user!

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
    @microtask.log_entries.create({:message =>"Processing", :user_id => @microtask.translator.id })
    @microtask.save
  end

  def update_microtask
    @microtask = Microtask.find(params[:id])
    @microtask.translated_paragraph = params[:translated_paragraph]
    @microtask.status = "Submitted"
    @microtask.translator = current_user
    if @microtask.save
      @microtask.log_entries.create({:message =>"Submitted", :user_id => @microtask.translator.id })
      flash[:notice] = "The task has been translated"
      redirect_to user_root_path
    end
  end

  def accept_microtask
    @microtask = Microtask.find(params[:id])
    @microtask.status = "Accepted"
    @microtask.translator.points += @microtask.points
    if @microtask.translator.save
      if @microtask.save
        @microtask.log_entries.create({:message =>"Accepted", :user_id => @microtask.translator.id })
        LogEntry.create({:message =>"#{@microtask.points} Points Earned", :user_id => @microtask.translator.id })
        @microtask.log_entries.create({:message =>"#{@microtask.points} Points Paid", :user_id => current_user.id })
        flash[:notice] = "Paragraph #{@microtask.paragraph_index + 1} has been accepted"
        redirect_to task_path(@microtask.task)
      end
    end
  end

  def reject_microtask
     @microtask = Microtask.find(params[:id])
     @microtask.log_entries.create({:message =>"Rejected", :user_id => @microtask.translator.id })
     @microtask.translator = nil
     @microtask.translated_paragraph = nil
     @microtask.status = "Open"
       if @microtask.save
         flash[:notice] = "Paragraph #{@microtask.paragraph_index + 1} has been rejected"
         redirect_to task_path(@microtask.task)
       end
   end
end