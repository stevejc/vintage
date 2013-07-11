module ApplicationHelper
 
  def flash_class(type)
    case type
    when :alert
      "alert-error"
    when :notice
      "alert-success"
    else
      ""
    end
  end
  
  def display_address(address)
    content_tag(:div,
    (content_tag(:p, content_tag(:b, address.name)) + 
    content_tag(:p, address.address1) +
    content_tag(:p, address.address2) +
    content_tag(:p, address.city + ", " + address.state + " " + address.zip)), :class =>"display-address")
  end
  
  def display_credit_card_form(section)
    if section == "current"
      if  current_user.last4?
        "display-section"
      else
        "hide-section"
      end
    else
      if  current_user.last4?
        "hide-section"
      else
        "display-section"
      end
    end
  end
  
  def errors_for(model, attribute)
    if model.errors[attribute].present?
      content_tag :span, :class => 'help-inline' do
        model.errors[attribute].join(", ")
      end
    end
  end
  
end
