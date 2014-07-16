module ProductsHelper
  def print_price(price)
    number_to_currency(price, unit: "RM ")
  end
  
  def print_stock(stock)
    if stock > 0
      content_tag(:div, content_tag(:p, "Item is in stock"), class: "instock")
    else
      content_tag(:div, content_tag(:p, "Item is out of stock"), class: "outstock")
    end
  end
end
