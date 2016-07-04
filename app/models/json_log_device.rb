class JsonLogDevice
  include Mongoid::Document
  field :device_id, type: Integer
  field :data_log, type: Array
end
