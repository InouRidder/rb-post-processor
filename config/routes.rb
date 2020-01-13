# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :formattings, only: :create
  end
end
