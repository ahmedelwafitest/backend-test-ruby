require 'rails_helper'

RSpec.describe EventAttribute, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:data_type) }
    it { should validate_uniqueness_of(:name).scoped_to(:event_id) }
  end
end
