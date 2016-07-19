class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :type
      t.boolean :state
      t.datetime :time_turned_on
      t.datetime :time_last_used
      t.references :house, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
