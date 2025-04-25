class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]  # ← ここがポイント！

  def index
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
    puts "current_user：#{current_user&.email || 'ログインしていません'}"
    puts "＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝"
  end
end
