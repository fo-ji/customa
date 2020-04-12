class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :company_name,      null: false
      t.string :responsible_party, null: false
      t.string :address,           null: false
      t.string :postal_code,       null: false
      t.string :phone_number,      null: false
      t.string :email,             null: false
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
