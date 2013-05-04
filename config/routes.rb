Rails.application.routes.draw do
  resources :subject_heading_types
  resources :classification_types
  resources :classifications
  resources :subject_types
  resources :subjects
end
