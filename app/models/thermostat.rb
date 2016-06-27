class Thermostat < Device
  validates :temperature, presence: true
end
