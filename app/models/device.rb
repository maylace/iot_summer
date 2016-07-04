class Device < ActiveRecord::Base
  belongs_to :house
  after_update :write_log

  def write_log
    @log = JsonLogDevice.where(device_id: id).last
    @log.data_log.push([time_turned_on, temperature])
    @log.save
  end
end
