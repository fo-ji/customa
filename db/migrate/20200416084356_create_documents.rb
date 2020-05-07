class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string     :name,     null: false
      t.string     :document, null: false
      t.integer    :category, null: false, default: 0
      t.integer    :row_order
      t.references :client,   null: false, foreign_key: true
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end

    add_index :documents, :name, unique: true
  end
end
