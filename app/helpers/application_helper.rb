module ApplicationHelper
  def show_cart(cart)
    cart.map{|i| i["quantity"]}.map(&:to_i).sum
  end
end
