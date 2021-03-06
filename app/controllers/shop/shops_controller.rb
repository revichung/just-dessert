class Shop::ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_shop

  def index #店家後台首頁
    @shop = current_user.shop
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = current_user.id
    if @shop.save
      flash[:notice] = "成功建立商店"
      redirect_to shop_shops_path(@shop)
    else
      flash.now[:alert] = "商店建立失敗!!"
      render :new
    end
  end

  def edit
    @shop = current_user.shop
  end

  def update
    @shop = current_user.shop
    if @shop.update(shop_params)
      flash[:notice] = "更新成功"
      redirect_to shop_shops_path(@shop)
    else
      flash.now[:alert] = "更新失敗"
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:shopname, :tel, :location, :opening_hours, :intro, :user_id, :logo, :image)
  end
  
end
