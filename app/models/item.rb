class Item
  attr_accessor :name, :quantity, :price, :user_id, :essay_path
  def initialize(user_id, name, quantity, price, essay_path)
    self.user_id, self.name, self.quantity, self.price, self.essay_path = user_id, name, quantity, price, essay_path
  end
end