class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :spree_users, :recipient, :string
    add_column :spree_users, :juridical_address, :string
    add_column :spree_users, :inn, :string
    add_column :spree_users, :kpp, :string
    add_column :spree_users, :recipient_bank, :string
    add_column :spree_users, :settlement_acc, :string
    add_column :spree_users, :corr, :string
    add_column :spree_users, :bik, :string
    add_column :spree_users, :nds, :boolean
    add_column :spree_users, :juridical, :boolean, :default => false
  end
end
