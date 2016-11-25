class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.string :title
      t.string :artist
      t.string :location
      t.time :start_time
      t.time :end_time
      t.integer :seats
      t.date :date

      t.timestamps
    end
  end
end
