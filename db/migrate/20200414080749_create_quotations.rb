class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.string     :name,      null: false
      t.integer    :row_order
      t.references :client,    null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end

    add_index :quotations, :name
  end
end
