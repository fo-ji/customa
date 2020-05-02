class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.references :user,      foreign_key: true
      t.references :quotation, foreign_key: true
      t.references :minute,    foreign_key: true
      t.references :other,     foreign_key: true
      t.timestamps
    end
  end
end
