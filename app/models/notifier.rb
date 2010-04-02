class Notifier < ActionMailer::Base
  default_url_options[:host] = "localhost:3000"

  def order_information(order)
    subject       "Заказ"
    from          "Binary Logic Notifier #{order}"
    recipients    "saxa888@mail.ru"
    sent_on       Time.now
    body[:order] = order
  end

end
