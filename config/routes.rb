OpptakIsfitOrg::Application.routes.draw do
  root to: "parliaments#index"

  resources :parliaments, except: [:new]
end
