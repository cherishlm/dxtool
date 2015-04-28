get '/setting' do
  @settings = Setting.all
  erb :setting
end
post '/setting' do

end
