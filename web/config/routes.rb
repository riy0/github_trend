Rails.application.routes.draw do
  root 'githubs#index'
  get 'githubs/show'
  get 'githubs/developer'
  get 'githubs/developers'
end
