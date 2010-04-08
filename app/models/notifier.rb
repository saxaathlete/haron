class Notifier < ActionMailer::Base
  default_url_options[:host] = "http://haron.com.ua"

  def order_information(order)
    subject       "Заказ"
    from          "Binary Logic Notifier #{order}"
    recipients    "haronua@rambler.ru"
    sent_on       Time.now
    body[:order] = order
  end

end
