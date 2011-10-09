Rails.application.routes.draw do
  resources :subject_has_classifications
  resources :subject_heading_types do
    resources :subjects
  end
  resources :subject_heading_type_has_subjects
  resources :classifications do
    resources :subject_has_classifications
  end
  resources :classification_types do
    resource :classifications
  end
  resources :subject_types

  resources :work_has_subjects

  resources :subjects do
    resources :works, :controller => 'manifestations'
    resources :subject_heading_types
    resources :subject_has_classifications
    resources :work_has_subjects
    resources :classifications
  end

  resources :works, :controller => 'manifestations' do
    resources :subjects
    resources :work_has_subjects
  end

  resources :manifestations do
    resources :work_has_subjects
    resources :subjects
  end
end
