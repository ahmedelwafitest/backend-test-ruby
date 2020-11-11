require 'rails_helper'

RSpec.describe UserAttribute, type: :model do
  describe 'validations' do

    subject { build(:user_attribute) }
    
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:data_type) }
    it { should validate_uniqueness_of(:name) }
  end
end
