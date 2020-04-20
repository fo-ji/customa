class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string     :document,  null: false
      t.references :quotation, foreign_key: true
      t.references :minute,    foreign_key: true
      t.references :other,     foreign_key: true
      t.timestamps
    end
  end
end
