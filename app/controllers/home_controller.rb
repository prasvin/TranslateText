class HomeController < ApplicationController
  def index
  end

  def user
    if current_user.type == "Requester"
      render 'requester'
    end
  end

  def requester
  end

  def translator
  end

end
