class OrderMailer < ApplicationMailer
  def receipt_email(order)
    @order = order
    @url  = 'http://localhost:3000/orders'
    mail(to: @order.email, subject: "Order ID: #{@order.id} - The details of your recent order")
  end
end


