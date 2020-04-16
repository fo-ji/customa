class CreateMinutes < ActiveRecord::Migration[5.2]
  def change
    create_table :minutes do |t|
      t.string     :name
      t.integer    :row_order, null: false
      t.references :client,    null: false, foreign_key: true
      t.timestamps
    end

    add_index :minutes, :name
  end
end
