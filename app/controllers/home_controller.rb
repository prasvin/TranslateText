class HomeController < ApplicationController
  def index
  end

  def user
    if current_user.type == "Requester"

    end
  end

end
