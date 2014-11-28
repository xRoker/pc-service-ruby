class Distribute < Struct.new(:title, :text)

  def perform
    Subscriber.all.each do |s|
      NewsMailer.send_news(User.find(s.user_id).email, title, text).deliver
    end
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Sended!"
  end
  
end