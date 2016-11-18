module ApplicationHelper
  def get_user_avatar(user_avatar)
    user_avatar.present? ? user_avatar : User::default_avatar_path
  end

  def show_cart(cart)
    cart.map{|i| i["quantity"]}.map(&:to_i).sum
  end

  def convert_db_time(date)
  	return date.strftime("%m/%d/%Y %I:%M %p")
  end
end
