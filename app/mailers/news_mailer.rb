class NewsMailer < ActionMailer::Base
  default from: ENV['MY_EMAIL']

  def send_news email, subject, text
    mail(to: email, subject: subject, body: text)
  end

end
