class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.datetime :created_at
      t.timestamps null: false
    end
  end
end
