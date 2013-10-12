Brails::Application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  namespace :admin do
    resources :level
      resources :comments
      resources :questions, as: "bonus_questions"
      resources :topics, shallow: true
    end

    resources :topic do
      resources :comments
      resources :contents, shallow: true
      resources :questions
    end

    resources :content do
      resources :comments
      resources :questions
    end

    resources :invitation, except: [:new, :create]
    resources :feedback, only: [:index, :show]
  end

  resources :level, only: [:show, :index] do
    resources :comments
    resources :questions, as: "bonus_questions", only: [:answer]
    resources :topics, only: [:show, :index]
  end

  resources :topic, only: [:show, :index] do
    resources :comments
    resources :contents,only: [:show, :index]
    resources :questions, only: [:show, :index, :answer]
  end

  resources :content, only: [:show, :index] do
    resources :comments
    resources :questions, only: [:answer]
  end

  resources :invitation, only: [:new, :create]
  resources :feedback, only: [:new, :create]
end