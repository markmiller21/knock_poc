class CartsController < ApplicationController
  def add_to_cart
    essay = Essay.find(params[:essay_id])
    all_items = session[:cart]
    new_item = Item.new(essay.id, essay.author, 1, 5, essay.essay_path.url)
    if session[:cart].blank?
      session[:cart] = [new_item]
    else
      if all_items.any?{|i| i["essay_id"] == essay.id }
        all_items.collect { |item|
          if item["essay_id"] == essay.id
            item["quantity"] += 1
          end
        }
        session[:cart] = all_items
      else
        session[:cart] << new_item
      end
    end
    #byebug
    redirect_to :back
  end

  def checkout

  end
end
