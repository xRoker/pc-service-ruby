class NewsMailer < ActionMailer::Base
  default from: ENV["MY_EMAIL"]

  def send_news email, subject, text
    mail(to: email, subject: subject, body: text)
  end

  def registration user
    @username = user.name
    @url = root_path
    mail(to: user.email, subject: "Witam w naszem serwisie!").send_later(:deliver)
  end

  def acceptation email
    mail(to: email, subject: "Naprawa", body: "Witam! Naprawa została przyjęta").send_later(:deliver)
  end

end
