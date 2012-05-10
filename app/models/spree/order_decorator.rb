Spree::Order.class_eval do
  def kopeek
    ('%.2f' % (total - total.to_i)).gsub(/0\./, '')
  end
end
