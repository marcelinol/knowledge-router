class AddCodeToPocketAccount < ActiveRecord::Migration
  def change
    add_column :pocket_accounts, :code, :string
  end
end
