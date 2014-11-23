class NewsMailer < ActionMailer::Base
  default from: "xroker@gmail.com"

  def send_news email, subject, text
    mail(to: email, subject: subject, body: text)
  end

end
