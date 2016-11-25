class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :concert_id
      t.integer :user_id
      t.float :price
      t.datetime :issued, null: false, default: Time.now
      t.datetime :expired

      t.timestamps
    end
  end
end
