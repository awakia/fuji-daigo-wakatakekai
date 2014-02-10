FujiDaigoWakatakekai::Application.routes.draw do
  resources :uploads

  resources :posts

  root to: "pages#root"

  resources :admin, only: [:index] do
    collection do
      post :become_admin
    end
  end

  match "/:action",
    :constraints => { :action => /#{Page.all.map(&:path).join('|')}/ },
    :to => 'pages',
    :as => :pages,
    :via => [:get, :post]
end
