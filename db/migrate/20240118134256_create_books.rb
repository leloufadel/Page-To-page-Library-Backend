class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :cover_photo
      t.string :author
      t.string :publisher
      t.date :publish_date

      t.timestamps
    end
  end
end
