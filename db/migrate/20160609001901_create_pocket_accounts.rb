class CreatePocketAccounts < ActiveRecord::Migration
  def change
    create_table :pocket_accounts do |t|
      t.string :access_token
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
