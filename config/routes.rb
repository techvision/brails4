Brails::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :admin do
    resources :levels do
      resources :questions, as: "bonus_questions"
      resources :topics, shallow: true
    end

    resources :topics, only: [:show, :index] do
      resources :contents, shallow: true
      resources :questions
    end

    resources :contents do
      resources :questions
    end

    resources :users do
      resources :invitations, except: [:new, :create]
      resources :feedbacks, only: [:index, :show]
    end
  end

  resources :levels, only: [:show, :index] do
    resources :comments
    resources :questions, only: [:answer]
  end

  resources :topics, only: [:show, :index] do
    resources :comments
    resources :questions, only: [:show, :index, :answer]
  end

  resources :contents, only: [:show, :index] do
    resources :comments
    resources :questions, only: [:answer]
  end

  resources :users, except: [:index, :destroy] do
    resources :invitations, only: [:new, :create]
    resources :feedbacks, only: [:new, :create]
  end

  resources :questions, only: [:show, :answer] do
    resources :comments
  end
end