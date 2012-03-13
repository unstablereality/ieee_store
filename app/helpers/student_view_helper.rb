module StudentViewHelper
  def inventory_color(quantity, nominal)
    if (quantity < (nominal * 0.20) && quantity != 0)
      color = "low_qty"
    elsif (quantity == 0)
      color = "sold_out"
    else 
      color = ""
    end
    return color
  end
end
