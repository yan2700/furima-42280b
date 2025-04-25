Rails.application.routes.draw do
 
    devise_for :users
    root "items#index"         # ← コメントアウトを外す！
    resources :items
  
  
end
