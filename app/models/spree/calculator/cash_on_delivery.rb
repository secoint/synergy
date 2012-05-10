class Spree::Calculator::CashOnDelivery < Spree::Calculator
  def self.description
    I18n.t("cash_on_delivery")
  end

  def compute(object)
    0
  end
end
