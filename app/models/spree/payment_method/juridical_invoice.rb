class Spree::PaymentMethod::JuridicalInvoice < Spree::PaymentMethod::Check
  def desc
    "<p>#{I18n.t('juridical_invoice')}</p>".html_safe
  end
end
