get '/' do
  erb :index
end

get '/maptest/posts/:id' do
  @post = Post.find(params[:id])
  @search_terms = "#{@post.cafe_name} #{@post.city} #{@post.state}"
  erb :'_map_test', layout: :map
end
