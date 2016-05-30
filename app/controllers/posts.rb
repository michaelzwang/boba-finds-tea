get '/posts' do
  @posts = Post.all.reverse[0..9]
  erb :'posts/posts'
end

get '/posts/search' do

  erb :'posts/search'
end

get '/posts/search_results' do
  @search_results = Post.where("cafe_name ILIKE ? AND city ILIKE ?", "#{params[:post][:cafe_name]}%", "#{params[:post][:city]}%")

  erb :'posts/search_results'
end

get '/posts/feed' do
  following = current_user.following
  @following_users_posts = []
  following.each do |u|
    u.posts.each do |p|
      @following_users_posts << p
    end
  end
@following_users_posts.reverse!

  erb :'posts/feed'
end

get '/posts/new' do
  erb :'posts/new_post'
end

post '/posts' do
  @post = Post.new(params[:post])
  GeoCoder.update_post_with_coordinates(@post)
  if @post.save
    current_user.posts << @post
    redirect "/users/profile/#{current_user.id}"
  else
    status 422
    @errors = @post.errors.full_messages
    erb :'posts/new_post'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :'posts/show_post'
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :'posts/edit_post'
end

put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.assign_attributes(params[:post])
  if @post.save
    redirect "/posts/#{@post.id}"
  else
    status 422
    erb :'posts/edit_post'
  end
end

delete '/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect "/users/profile/#{current_user.id}"
end
