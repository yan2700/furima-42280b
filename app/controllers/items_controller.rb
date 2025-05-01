class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # ログイン必須

  def index
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    puts "current_user：#{current_user&.email || 'ログインしていません'}"
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new  # ここで商品オブジェクトを作成
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path, alert: '不正なアクセスです。自分が出品した商品以外は編集できません。'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])  
    if @item.update(item_params) 
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
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
end
