class Notifier < ActionMailer::Base
  default_url_options[:host] = property(:app_config)

  def order_information(order)
    subject       "Заказ"
    from          "Binary Logic Notifier #{order}"
    recipients    "haronua@rambler.ru"
    sent_on       Time.now
    body[:order] = order
  end

end
