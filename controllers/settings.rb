get '/setting' do
  @settings = Setting.all
  erb :setting
end
post '/setting' do
  setting = Setting.new(params[:setting])
  _setting = Setting.find(:key=>key)
  if _setting
    'has'
  else
    setting.save
    'empty'
  end
end
