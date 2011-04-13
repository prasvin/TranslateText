class HomeController < ApplicationController
  def index
  end

  def user
    if current_user.type == "Requester"
      @tasks = current_user.tasks
      render 'requester'
    else
      @microtasks = Microtask

      if params[:points]
          @microtasks = @microtasks.pays_more_than(params[:points].to_f)
      end

      if params[:language_to]
        @microtasks = @microtasks.with_language_to(params[:language_to]) unless params[:language_to] == "*"
      end

      if params[:language_from]
        @microtasks = @microtasks.with_language_from(params[:language_from]) unless params[:language_from] == "*"
      end

      @microtasks = @microtasks.page(params[:page]).per(4)
      render 'translator'
    end

  end

  def requester
  end

  def translator
  end

end
