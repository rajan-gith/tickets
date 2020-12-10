Rails.application.routes.draw do
  resources :shows
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'tickets/book/:id' , to: 'tickets#book', as: 'book_ticket'
  post 'tickets/book/:id' , to: 'tickets#create', as: 'create_ticket_booking'
end
