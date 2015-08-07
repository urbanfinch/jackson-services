require File.dirname(__FILE__) + '/bootstrap.rb'

class JacksonServices < Sinatra::Base

  configure do
    set :root,    File.dirname(__FILE__)
    set :views,   File.join(Sinatra::Application.root, 'views')
    set :haml,    { :format => :html5, :layout => :'layouts/jackson-services' }

    if production?
      ActionMailer::Base.smtp_settings = {
        :address => "smtp.sendgrid.net",
        :port => '25',
        :authentication => :plain,
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :domain => ENV['SENDGRID_DOMAIN'],
      }
      ActionMailer::Base.view_paths = File.join(Sinatra::Application.root, 'views')
    else
      ActionMailer::Base.delivery_method = :file
      ActionMailer::Base.file_settings = { :location => File.join(Sinatra::Application.root, 'tmp/emails') }
      ActionMailer::Base.view_paths = File.join(Sinatra::Application.root, 'views')
    end
  end

  get '/' do
    redirect '/home'
  end

  get '/:section/?' do
    begin
      haml "#{params[:section]}/#{params[:section]}".to_sym
    rescue
      pass
    end
  end

  get '/:section/:page/?' do
    begin
      haml "#{params[:section]}/#{params[:page]}/#{params[:page]}".to_sym
    rescue
      pass
    end
  end

  get '/:section/:page/:subpage/?' do
    begin
      haml "#{params[:section]}/#{params[:page]}/#{params[:subpage]}/#{params[:subpage]}".to_sym
    rescue
      pass
    end
  end

  get '/:section/:page/:subpage/:division/?' do
    begin
      haml "#{params[:section]}/#{params[:page]}/#{params[:subpage]}/#{params[:division]}/#{params[:division]}".to_sym
    rescue
      pass
    end
  end

  post '/contact_us/contact' do
    Mailer.contact(params[:contact]).deliver
    redirect '/contact_us'
  end

  post '/contact_us/request_service' do
    Mailer.request_service(params[:request_service]).deliver
    redirect '/contact_us'
  end

  get '/*' do
    redirect '/'
  end

  not_found do
    redirect '/'
  end
end
