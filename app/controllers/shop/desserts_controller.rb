class Shop::DessertsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_shop

  def index
    
  end
end
