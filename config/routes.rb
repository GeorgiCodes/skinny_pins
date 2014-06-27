Rails.application.routes.draw do
  resources :urls, :only => [:show, :new, :create]
  root :to => redirect('/urls/new')
end
