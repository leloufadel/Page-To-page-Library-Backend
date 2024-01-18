class AddUserReferenceToRervations < ActiveRecord::Migration[7.1]
  def change
    add_reference :reservations, :user, foreign_key: true
  end
end
