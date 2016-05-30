get '/posts/:id/likes' do
  post = Post.find(params[:id])
  like = Like.new
  if like.save
    post.likes << like
    current_user.likes << like
    if request.xhr?

      content_type :json
      {like_count: post.like_count.to_s, id: post.id}.to_json
    else
      redirect "/posts"
    end
  end
end
