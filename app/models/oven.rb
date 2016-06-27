class Oven < Device
  validates :timer, presence: true
  validates :temperature, presence: true
end
