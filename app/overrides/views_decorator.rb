Deface::Override.new(
  :virtual_path => "spree/admin/orders/show",
  :name => "synergy_admin_order_show_buttons",
  :insert_before => "[data-hook='admin_order_show_buttons'], #admin_order_show_buttons[data-hook]",
  :text => "
  <%= button_link_to t(\"courier_instructions\"), orders_courier_instruction_path(@order), :target => \"_blank\" if @order.completed_at %>
  ",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/admin/configurations/index",
  :name => "synergy_admin_configurations_menu",
  :insert_before => "[data-hook='admin_configurations_menu'], #admin_configurations_menu[data-hook]",
  :text => "<tr>
  <td><%= link_to t(\"synergy_settings\"), admin_synergy_settings_path %></td>
  <td><%= t(\"synergy_settings_desc\") %></td>
  </tr>",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/admin/shared/_configuration_menu",
  :name => "synergy_admin_configurations_sidebar_menu",
  :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
  :text => "<li<%== ' class=\"active\"' if controller.controller_name == 'synergy_settings' %>><%= link_to t(\"synergy_settings\"), admin_synergy_settings_path %></li>",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/admin/shared/_order_tabs",
  :name => "synergy_admin_order_tabs",
  :insert_bottom => "[data-hook='admin_order_tabs'], #admin_order_tabs[data-hook]",
  :partial => "spree/admin/orders/juridical_tabs",
  :disabled => false)

Deface::Override.new(
  :virtual_path => "spree/users/show",
  :name => "synergy_account_summary",
  :insert_bottom => "[data-hook='account_summary'] #user-info",
  :partial => "spree/users/status",
  :disabled => false) if Spree::Synergy::Config[:juridical_enabled]

Deface::Override.new(
  :virtual_path => "spree/shared/_user_form",
  :name => "synergy_account_edit",
  :insert_bottom => "#password-credentials",
  :partial => "spree/users/status_form",
  :disabled => false) if Spree::Synergy::Config[:juridical_enabled]
