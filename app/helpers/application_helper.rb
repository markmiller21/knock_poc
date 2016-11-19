module ApplicationHelper
  def show_cart(cart)
    cart.map{|i| i["quantity"]}.map(&:to_i).sum
  end

  # converts rails Time object into a digestable format
  def convert_db_time(date)
  	return date.strftime("%m/%d/%Y %I:%M %P")
  end
end
