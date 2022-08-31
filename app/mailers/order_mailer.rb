class OrderMailer < ApplicationMailer
  def order_receipt
    @order = params[:order]
    @user = params[:user]
    @order_items = params[:order_items]
    mail(to: @user.email, subject: "Jungle Order ##{@order.id}")
  end
end
