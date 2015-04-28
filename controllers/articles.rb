get '/' do
  @setting = Setting.all
  erb :index
end
