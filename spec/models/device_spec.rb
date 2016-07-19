require 'rails_helper'

RSpec.describe Device, type: :model do
  before { @device = FactoryGirl.create(:device) }
  subject { @device }
  it { shold be_valid }
end
