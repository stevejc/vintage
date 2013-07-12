module ItemsHelper
  def format_quantity(quantity)
    if quantity <= 0
      "So sorry, this item is currently sold out!"
    elsif quantity == 1
      "Only 1 available"
    else
      "#{quantity} available."
    end
  end
  
  def display_loves(count)
    if count == 0
      "Be the first to favorite this item!"
    elsif count == 1
      "1 Person loves this item"
    else
      "#{count} People love this item."
    end
  end
  
  def display_item_status(item) 
    cc = case item.status
    when "Pending" 
      "alert-error"
    when "Available"
      "alert-success"
    else 
      "alert-info"
    end 
    
    content_tag(:div, 
    (content_tag(:h3, "Status: #{item.status}") + 
      if item.status == "Pending"
        content_tag(:p, "Your item is not yet listed for sale on HomePlace. Every item listed for sales requires at least one image, at least a quantity of 1 item available if your item is ready to go update the status to Available.") + 
        (content_tag(:div,
        (content_tag(:i, " ", class: "icon-ok") + 
        content_tag(:h5, "Add at least 1 image!", class: "inline") if !item.item_images.exists?) )) + 
        
        (content_tag(:div,
        (content_tag(:i, " ", class: "icon-ok") + 
        content_tag(:h5, "Add Quantity Available!", class: "inline") if item.quantity == 0) )) +
         
        (content_tag(:div,
        (content_tag(:i, " ", class: "icon-ok") + 
        content_tag(:h5, "Set-up your shop to accept credit cards with Stripe?", class: "inline") if !item.shop.stripe_shop_token?) )) +
        (if item.item_images.exists? && item.shop.stripe_shop_token? && item.quantity > 0
          link_to(list_for_sale_path(item), class: "btn") do
            "list for sale"
          end
        end)
      elsif item.status == "Available"
        content_tag(:p,"Your item is listed for sale on HomePlace. If your item is no longer for sale please update the status to pending or change the quantity available to zero.")
      else
        content_tag(:p, "Your item is not available for sale because the quantity available is zero. If you still have items available please update the quantity and change the status to Available.")
      end    
    ), id:"item-status", class: "#{cc}")
  end
end