require File.dirname(__FILE__) + '/bootstrap.rb'

class JacksonServices < Sinatra::Base
  
  configure do
    set :root,    File.dirname(__FILE__)
    set :views,   File.join(Sinatra::Application.root, 'views')
    set :haml,    { :format => :html5, :layout => :'layouts/jackson-services' }
  end
  
  get '/' do
    redirect '/home'
  end
  
  get '/:section/?' do
    haml "#{params[:section]}/#{params[:section]}".to_sym
  end
  
  get '/:section/:page/?' do
    haml "#{params[:section]}/#{params[:page]}/#{params[:page]}".to_sym
  end
  
  get '/:section/:page/:subpage/?' do
    haml "#{params[:section]}/#{params[:page]}/#{params[:subpage]}/#{params[:subpage]}".to_sym
  end
  
  get '/:section/:page/:subpage/:division/?' do
    haml "#{params[:section]}/#{params[:page]}/#{params[:subpage]}/#{params[:division]}/#{params[:division]}".to_sym
  end
  
  get '/*' do
    redirect '/'
  end
end