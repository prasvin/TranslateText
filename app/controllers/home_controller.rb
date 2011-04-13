class HomeController < ApplicationController
  MTASKS_PER_PAGE = 4

  def index
  end

  def user
    if current_user.type == "Requester"
      @tasks = current_user.tasks
      render 'requester'
    else
      current_user.clear_idle_microtasks
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
      @microtasks = @microtasks.open.page(params[:page]).per(MTASKS_PER_PAGE)
      render 'translator'
    end

  end

  def requester
  end

  def translator
  end

end
