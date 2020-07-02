class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.string :description
      t.datetime :date
      t.integer :creator_id

      t.timestamps
    end
  end
end
