get '/articles' do
  @articles = Article.all
  erb :articles
end
get '/articles/:id/edit' do
  protected!
  @article = Article.find_by_id!(params[:id])
  erb :_form
end
get '/articles/new' do
  protected!
  @article = Article.new
  erb :_form
end

post '/articles' do
  protected!
  @article = Article.new(params[:article])
  @article.created_at = DateTime.now

  if @article.save
    flash[:success] = '创建成功!';
    redirect to("/articles/#{@article.id}/edit")
  else
    flash[:error] = '创建失败!';
    redirect back
  end
end

get '/articles/:id' do
  @article = Article.find_by_id(params[:id])
  erb :article
end

put '/articles/:id' do
  protected!
  @article = Article.find_by_id(params[:id])
  @article.updated_at = DateTime.now

  if @article.update(params[:article])
    flash[:success] = '更新成功!'
  else
    flash[:error] = '更新失败!'
  end

  redirect to("/articles/#{@article.id}/edit")
end

delete '/articles/:id' do
  protected!
  'delete articles'
end
