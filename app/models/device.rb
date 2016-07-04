class Device < ActiveRecord::Base
  belongs_to :house
  after_save :write_log

  def write_log
    @log = Json_log_devices.where(device_id: id).last
    @log.data_log.push([time_turned_on, temperature])
    @log.save
  end
end
