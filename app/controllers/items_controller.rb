<<<<<<< HEAD
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]  # ログイン必須

  def index
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    puts "current_user：#{current_user&.email || 'ログインしていません'}"
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new  # ここで商品オブジェクトを作成
  end

  def show
   @item = Item.find(params[:id])
  end

  def create 
    @item = Item.new(item_params)
    @item.user_id = current_user.id  # ユーザーのIDをセット
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private  # ここから下はprivateメソッドとして定義する

  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :price, 
      :category_id, 
      :status_id, 
      :shipping_fee_status_id, 
      :prefecture_id, 
      :scheduled_delivery_id, 
      :image
    )  # ここでの閉じ括弧を忘れずに
  end
=======
class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]  # ログイン必須

  def index
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    puts "current_user：#{current_user&.email || 'ログインしていません'}"
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    @items = Item.order(created_at: :desc)

  end

 # def show
   # @item = Item.find(params[:id])
  #end

  def new
    @item = Item.new  
  end

  def show
   @item = Item.find(params[:id])
  end

  def create 
    @item = Item.new(item_params)
    @item.user_id = current_user.id  # ユーザーのIDをセット
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private  # ここから下はprivateメソッドとして定義する

  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :price, 
      :category_id, 
      :status_id, 
      :shipping_fee_status_id, 
      :prefecture_id, 
      :scheduled_delivery_id, 
      :image
    )  # ここでの閉じ括弧を忘れずに
  end
>>>>>>> e9ec3ff4cedb8e1a6c7f2f35330569d4fc8b8072
end