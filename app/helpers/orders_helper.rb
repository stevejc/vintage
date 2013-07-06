module OrdersHelper

    def display_items_in_order(order)
      items = ""
      order.line_items.each do |line_item|
      items += line_item.item.title + "<br/>"
      end
      return items
    end
    
    def current_customer
      if current_user.stripe_customer_token.nil?
        "no"
      else
        "yes"
      end
    end
end