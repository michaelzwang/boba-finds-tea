post '/users/new' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/users/profile/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/profile'
  end
end

get '/users/login' do

  erb :'/users/login'
end

post '/users/login' do

  if User.authenticate(params[:user][:email], params[:user][:password])
    user = User.find_by(email: params[:user][:email])
    session[:user_id] = user.id
    redirect "/posts/feed"
  else
    @error = 'Email and password match not found'
    erb :'users/login'
  end
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/profile/:id' do

@user = User.find_by(id: params[:id])
@posts = @user.posts.reverse
  if @user
    erb :'users/profile'
  else
    redirect '/'
  end
end

get '/users/:id/likes' do
  @user = User.find(params[:id])
  erb :'users/liked_posts'
end

post '/users/:id/follow' do
  @user = User.find(params[:id])
  relationship = Relationship.create

  current_user.active_relationships << relationship
  @user.passive_relationships << relationship
  redirect "/users/profile/#{@user.id}"
end

delete '/users/:id/unfollow' do
  @user = User.find(params[:id])
  relationship = Relationship.find_by(followed_id: @user.id, follower_id: current_user.id)
  relationship.destroy
  redirect "/users/profile/#{@user.id}"
end

