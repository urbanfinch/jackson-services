class Mailer < ActionMailer::Base
  def contact(params)
    @params = params
    
    mail(
      :to      => "jasjack@jackson-services.com",
      :from    => "mailer@jackson-services.com",
      :subject => "Contact from jackson-services.com") do |format|
        format.text
        format.html
    end
  end
  
  def request_service(params)
    @params = params
    
    mail(
      :to      => "jasjack@jackson-services.com",
      :from    => "mailer@jackson-services.com",
      :subject => "Request for service from jackson-services.com") do |format|
        format.text
        format.html
    end
  end
end