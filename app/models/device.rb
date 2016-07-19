class Device < ActiveRecord::Base
  belongs_to :house
  after_save :write_log

  def write_log
    if JsonLogDevice.where(device_id: id).exists?
      @log = JsonLogDevice.find_by(device_id: id)
    else
      @log = JsonLogDevice.new(device_id: id)
    end
    @log.data_log.push([time_turned_on, temperature])
    @log.save
  end
end
