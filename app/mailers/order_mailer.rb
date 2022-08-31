class OrderMailer < ApplicationMailer
  def order_receipt
    @order = params[:order]
    @user = User.find(session[:user_id])
    mail(to: @user.email, subject: "Jungle Order ##{@order.id}")
  end
end
