class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.string :name
      t.string :file,       null: false
      t.integer :row_order, null: false
      t.references :client, null: false, foreign_key: true
      t.timestamps
    end

    add_index :quotations, [:name, :file]
  end
end
