require 'rails_helper'

RSpec.describe HighFiveLog, type: :model do
  it { should validate_presence_of(:user_to) }
  it { should validate_presence_of(:user_from) }
  it { should validate_presence_of(:count) }
  it { should validate_presence_of(:comment) }
end
