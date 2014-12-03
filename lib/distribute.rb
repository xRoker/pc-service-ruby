class Distribute < Struct.new(:title, :text)

  def perform
    Subscriber.all.each do |s|
      NewsMailer.send_news(s.user.email, title, text).deliver
    end
    puts ">>>>>>>>>>>>>>>>>>> Newsletter has been distributed! >>>>>>>>>>>>>>>>>>>"
  end
  
end