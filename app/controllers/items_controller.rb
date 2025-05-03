class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # ログイン必須
  before_action :find_item, only: [:edit, :update, :show,:destroy]  # find_itemメソッドを共通
  before_action :move_to_index_if_sold, only: [:edit, :update] 

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
    if @item.user != current_user
      redirect_to root_path, alert: '不正なアクセスです。自分が出品した商品以外は編集できません。'
    end
  end

  def show
    
  end

  def update
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

  

  def destroy
    if @item.user == current_user
      @item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      redirect_to root_path, alert: '削除権限がありません'
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])  # find_itemメソッドで共通化
  end

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
    )
  end

  def move_to_index_if_sold
    redirect_to root_path if @item.order.present?
  end
end

