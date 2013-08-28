#GET====================================

get '/' do
  @categories = Category.groups
  # p @categories.length
  # Look in app/views/index.erb
  erb :index
end

get '/category/:id' do
  @category = Category.find(params[:id])

  @posts = @category.split_posts
  erb :_categories_and_posts
end

get '/post/new/:id' do
  erb :new_post
end

get '/secretkey/:secret_key' do
  @post = Post.where(:secret_key => params[:secret_key])
  p @post
  erb :edit
end


#POST===================================

post '/posts' do
  @post = Post.new(params[:post])
  @post[:secret_key] = SecureRandom.urlsafe_base64
  if @post.save
    redirect to("/secretkey/#{@post.secret_key}")
  else
    p @post
  erb :new_post
  end
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  p @post
  if @post.update_attributes(params[:post])
    redirect to("/category/#{@post.category_id}")
  else
    erb :edit
  end
end
