class CreateBookReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :book_reservations do |t|
      t.references :book, null: false, foreign_key: { to_table: 'books' }
      t.references :reservation, null: false, foreign_key: { to_table: 'reservations' }

      t.timestamps
    end
  end
end
