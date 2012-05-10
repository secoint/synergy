class AddSecondnameToAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :secondname, :string
  end
end
