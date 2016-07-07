class AddColumsToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :temperature, :float, :default => nil
    add_column :devices, :timer, :float, :default => nil
    add_column :devices, :json_log, :string
  end
end
