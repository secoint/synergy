class Spree::Calculator::Juridical < Spree::Calculator
  def self.description
    I18n.t("juridical_invoice")
  end

  def compute(object)
    0
  end
end
