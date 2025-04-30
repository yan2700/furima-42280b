<<<<<<< HEAD
Rails.application.routes.draw do
 
    devise_for :users
    root "items#index"         # ← コメントアウトを外す！
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  
end
=======
Rails.application.routes.draw do
 
    devise_for :users
    root "items#index"         # ← コメントアウトを外す！

    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]


    resources :items, only: [:index, :new, :create, ]

  
end
>>>>>>> e9ec3ff4cedb8e1a6c7f2f35330569d4fc8b8072
