class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :date
      t.date :due_date
      t.string :city

      t.timestamps
    end
  end
end
