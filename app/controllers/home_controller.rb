class HomeController < ApplicationController
  def index
  end

  def user
    if current_user.type == "Requester"
      @tasks = current_user.tasks
      render 'requester'

    end
  end

  def requester
  end

  def translator
  end

end
