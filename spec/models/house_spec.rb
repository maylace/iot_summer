require 'rails_helper'

RSpec.describe House, type: :model do
  before { @user = FactoryGirl.create(:user) }
  before { @house = FactoryGirl.build(:house) }

  subject { @house }

  it { should belong_to(:user) }
end
