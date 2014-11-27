class Distribute < Struct.new(:title, :text)

  def perform
    Subscriber.all.each do |s|
      NewsMailer.send_news(s.email, title, text).deliver
    end
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Sended!"
  end
  
end