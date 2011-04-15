class HomeController < ApplicationController
  MTASKS_PER_PAGE = 4

  before_filter :authenticate_user!, :except => [:index]

  def index
  end

  def user
    if current_user.type == "Requester"
      @tasks = current_user.tasks.order('created_at DESC')
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
        current_user.microtasks.first.log_entries.create(:message => "#{params[:points]} Points Purchased", :user_id => current_user.id)
        redirect_to user_root_path
      else
        flash[:notice] = "Your points cannot be been added"
        redirect_to user_root_path
      end
    else
      render :file => "#{Rails.root}/public/404.html", :status => :not_found
    end
  end

  def log
    if current_user.type == "Translator"
      @log = LogEntry.where(:user_id => current_user.id).page(params[:page]).per(20)
    else
      @log = current_user.log_entries
    end
  end

end
