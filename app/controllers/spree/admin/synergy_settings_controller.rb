class Spree::Admin::SynergySettingsController < Spree::Admin::BaseController
  def update
    params[:contacts].each do |name, value|
      next unless Spree::Config.has_preference? name
      Spree::Config[name] = value
    end

    params[:preferences].each do |name, value|
      next unless Spree::Synergy::Config.has_preference? name
      Spree::Synergy::Config[name] = value
    end

    redirect_to admin_synergy_settings_path
  end
end
