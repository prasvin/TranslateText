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
      @page_no = 1
      @per_page = MTASKS_PER_PAGE
      @page_no = params[:page].to_i if params[:page]
      @microtasks = Microtask
      if params[:language_to]
        @microtasks = @microtasks.with_language_to(params[:language_to]) unless params[:language_to] == "*"
      end
      if params[:language_from]
        @microtasks = @microtasks.with_language_from(params[:language_from]) unless params[:language_from] == "*"
      end
      if params[:points]
             @microtasks = @microtasks.pays_more_than(params[:points].to_f)
      end
      @microtasks = @microtasks.open.page(params[:page]).per(@per_page)
      render 'translator'
    end

  end

  def purchase_points_form
    if current_user.type != "Requester"
      render :file => "#{Rails.root}/public/404.html", :status => :not_found
    end
  end

  def purchase_points
    if current_user.type == "Requester"
      current_user.points += params[:points].to_f
      if current_user.save
        flash[:notice] = "#{params[:points]} points added"
        redirect_to user_root_path
      else
        flash[:notice] = "Your points cannot be been added"
        redirect_to user_root_path
      end
    else
      render :file => "#{Rails.root}/public/404.html", :status => :not_found
    end
  end

  def requester
  end

  def translator
  end

end
