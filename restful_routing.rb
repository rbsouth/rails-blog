          Prefix Verb URI Pattern                 Controller#Action
    sessions_new GET  /sessions/new(.:format)     sessions#new
 sessions_create GET  /sessions/create(.:format)  sessions#create
sessions_destroy GET  /sessions/destroy(.:format) sessions#destroy
  comments_index GET  /comments/index(.:format)   comments#index
    comments_new GET  /comments/new(.:format)     comments#new
 comments_create GET  /comments/create(.:format)  comments#create
   comments_show GET  /comments/show(.:format)    comments#show
   comments_edit GET  /comments/edit(.:format)    comments#edit
 comments_update GET  /comments/update(.:format)  comments#update
comments_destroy GET  /comments/destroy(.:format) comments#destroy
     posts_index GET  /posts/index(.:format)      posts#index
       posts_new GET  /posts/new(.:format)        posts#new
    posts_create GET  /posts/create(.:format)     posts#create
      posts_show GET  /posts/show(.:format)       posts#show
      posts_edit GET  /posts/edit(.:format)       posts#edit
    posts_update GET  /posts/update(.:format)     posts#update
   posts_destroy GET  /posts/destroy(.:format)    posts#destroy
     users_index GET  /users/index(.:format)      users#index
       users_new GET  /users/new(.:format)        users#new
    users_create GET  /users/create(.:format)     users#create
      users_show GET  /users/show(.:format)       users#show
      users_edit GET  /users/edit(.:format)       users#edit
    users_update GET  /users/update(.:format)     users#update
   users_destroy GET  /users/destroy(.:format)    users#destroy
