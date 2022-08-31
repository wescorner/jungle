# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_receipt
    @order = Order.new(id: 1, email: "wescorner@gmail.com", total_cents: 12345)
    OrderMailer.with(order: @order).order_receipt
  end

end
