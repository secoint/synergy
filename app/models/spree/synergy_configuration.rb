module Spree
  class SynergyConfiguration < Preferences::Configuration
    # validates :preferred_recipient, :preferred_address, :preferred_inn, :preferred_bank, :preferred_settlement_acc, :preferred_corr, :preferred_bik, :preferred_nds, :preferred_director, :preferred_accountant, :presence => true, :on => :update
    # validates :preferred_inn, :numericality => true, :length => { :is => 10 }, :on => :update
    # validates :preferred_kpp, :preferred_bik, :numericality => true, :length => { :is => 9 }, :on => :update
    # validates :preferred_settlement_acc, :preferred_corr, :numericality => true, :length => { :is => 20 }, :on => :update
    
    preference :juridical_enabled, :boolean, :default => false
    preference :recipient, :string
    preference :address, :string
    preference :inn, :string
    preference :kpp, :string
    preference :bank, :string
    preference :settlement_acc, :string
    preference :corr, :string
    preference :bik, :string
    preference :nds, :boolean, :default => false
    preference :director, :string
    preference :accountant, :string
  end

  AppConfiguration.class_eval do
    preference :store_email, :string, :default => 'test@site.ru'
    preference :store_phone, :string, :default => '+7 (495) 1234567'
    preference :store_address, :string, :default => 'Somewhere st. Nowhere'
  end
end
