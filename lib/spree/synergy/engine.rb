# coding: utf-8
module Spree
  module Synergy
    class Engine < Rails::Engine
      engine_name 'synergy'
      
      config.autoload_paths += %W(#{config.root}/lib)

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/overrides/*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end

        Time::DATE_FORMATS[:default] = "%d.%m.%Y - %H:%M"
        Date::DATE_FORMATS[:default] = "%d.%m.%Y"

        Time.zone = "Europe/Moscow"
        I18n.default_locale = :ru

        Spree::Config.set(:default_locale => :ru)
        Spree::Config.set(:default_country_id => 168)
        # Spree::Config.set(:allow_ssl_in_production => false)
        # Spree::Config.set(:disable_bill_address => true)
        # Spree::Config.set(:admin_interface_logo => "admin/logo.png")
        # checkout_zone = Zone.first
        # Spree::Config.set(:checkout_zone => checkout_zone.name) if checkout_zone
        
        # ::ADDRESS_FIELDS.clear << ["lastname", "firstname", "secondname", "country", "state", "city", "zipcode", "address1", "phone"]
        # ::ADDRESS_FIELDS.flatten!

        # # добавить событие для перехода от шага доставки к шагу подтверждения, минуя шаг оплаты
        # confirm_event = StateMachine::Event.new(Order.state_machine, :confirm_without_payment)
        # confirm_event.transition :to => 'confirm'
        # Order.state_machine.events << confirm_event
        
        # # переопределение события :next для отображения шага подтверждения в любом случае
        # next_event = StateMachine::Event.new(Order.state_machine, :next)
        # next_event.transition :from => 'cart',     :to => 'address'
        # next_event.transition :from => 'address',  :to => 'delivery'
        # next_event.transition :from => 'delivery', :to => 'payment'
        # next_event.transition :from => 'payment',  :to => 'confirm'
        # next_event.transition :from => 'confirm',  :to => 'complete'     
        # Order.state_machine.events << next_event
      end

      config.to_prepare &method(:activate).to_proc

      initializer "spree.synergy.environment", :before => :load_config_initializers do |app|
        Spree::Synergy::Config = Spree::SynergyConfiguration.new
      end
      
      initializer "spree.register.calculators" do |app|
        app.config.spree.calculators.shipping_methods = [
          Spree::Calculator::Juridical
        ]
      end
      
      initializer "spree.register.payment_methods" do |app|
        app.config.spree.payment_methods = [
          Spree::Gateway::Bogus,
          Spree::PaymentMethod::SberBankInvoice,
          Spree::PaymentMethod::JuridicalInvoice
        ]
      end
    end
  end
end
