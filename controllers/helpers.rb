helpers do
  alias_method :h,:escape_html

  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end
  def authorized?
    return true if session[:user]

    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    if @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == ['admin', 'admin']
      session[:user] = 'admin'
      true
    else
      false
    end
  end

  def configure(name)
    unless @config
      @config = YAML.load(File.open(File.dirname(__FILE__)+'/../config.yml'))
    end
    @config[name.to_s]
  end
end
