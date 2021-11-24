Rails.application.routes.draw do
  get 'visualize', to: 'display#visualize', as: 'visualize'
  get 'compare', to: 'display#compare', as: 'compare'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
