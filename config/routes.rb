FujiDaigoWakatakekai::Application.routes.draw do
  resources :posts

  root to: "pages#root"

  get "admin", to: "admin#index"

  match "/:action",
    :constraints => { :action => /#{Page.all.map(&:path).join('|')}/ },
    :to => 'pages',
    :as => :pages,
    :via => [:get, :post]
end
