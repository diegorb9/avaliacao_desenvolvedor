# frozen_string_literal: true

Rails.application.routes.draw do
  resources :sales, only: %i[index] do
    post :import, on: :collection
  end

  root 'sales#index'
end
