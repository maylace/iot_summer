class Json_log_devices
  include Mongoid::Document
  field :device_id, type: Integer
  field :data_log, type: Array
end
