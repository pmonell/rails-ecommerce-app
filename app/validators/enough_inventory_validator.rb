class EnoughInventoryValidator < ActiveModel::Validator
  def validate(record)
    record.order_items.each do |order_item|
      product = order_item.product
      if order_item.quantity > product.quantity
        record.errors["#{product.name}"] << "Is out of stock, only #{product.quantity} left"
      end
    end
  end
end
