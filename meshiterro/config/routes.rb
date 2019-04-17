Rails.application.routes.draw do
	devise_for :users
	root 'post_images#index'
	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
		resource :favorites, only: [:create, :destroy]
		resource :post_comments, only: [:create, :destroy]
	end
	resources :users, only: [:show, :edit, :update]
end


# $ rails routes
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create
#                      root GET    /                                                                                        post_images#index
#      post_image_favorites DELETE /post_images/:post_image_id/favorites(.:format)                                          favorites#destroy
#                           POST   /post_images/:post_image_id/favorites(.:format)                                          favorites#create
#  post_image_post_comments DELETE /post_images/:post_image_id/post_comments(.:format)                                      post_comments#destroy
#                           POST   /post_images/:post_image_id/post_comments(.:format)                                      post_comments#create
#               post_images GET    /post_images(.:format)                                                                   post_images#index
#                           POST   /post_images(.:format)                                                                   post_images#create
#            new_post_image GET    /post_images/new(.:format)                                                               post_images#new
#                post_image GET    /post_images/:id(.:format)                                                               post_images#show
#                           DELETE /post_images/:id(.:format)                                                               post_images#destroy
#                      user GET    /users/:id(.:format)                                                                     users#show
#                refile_app        /attachments                                                                             #<Refile::App app_file="/home/vagrant/.bundle/ruby/2.5.0/refile-46b4178654e6/lib/refile/app.rb">
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
