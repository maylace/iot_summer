class Device < ActiveRecord::Base
  belongs_to :house
  after_save :write_log

  def write_log
    @log = JsonLogDevice.find_by(device_id: id) || JsonLogDevice.new(device_id: id)
    @log.data_log.push([time_turned_on, temperature])
    @log.save
  end
end
