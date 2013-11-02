FujiDaigoWakatakekai::Application.routes.draw do
  resources :posts

  root to: "static#index"
  get "static/greeting"
  get "static/links"
  get "static/contact"

  get "admin", to: "admin#index"
end
