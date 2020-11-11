require 'rails_helper'

RSpec.describe EventRegistration, type: :model do
  describe 'associations' do
    it { should belong_to(:event) }
    it { should belong_to(:user) }
  end

  describe '#custom_attributes_value' do

  	context 'EventAttribute are empty:' do
      before(:each) do
        user = build(:user)
        event = build(:event)
        @subject = create(:event_registration, event: event, user: user)
        @result = ActiveSupport::HashWithIndifferentAccess.new
      end

      it "validates custom_attributes empty" do
        expect(@subject.custom_attributes_value).to eq(@result)
        subject.custom_attributes[:name] = "some_value"
        expect(@subject.custom_attributes_value).to eq(@result)
      end
    end

    context 'EventAttribute are not empty' do

      before(:each) do
        user = build(:user)
        event = build(:event)
        
        event_attributes1 = create(:event_attribute, :required, name: 'first_name', event: event)
        event_attributes2 = create(:event_attribute, :required, name: 'last_name', event: event)
        event_attributes3 = create(:event_attribute, :required, name: 'address', event: event)

        @subject = create(:event_registration, event: event, user: user)
        @subject.custom_attributes[:name] = "some_value"
        @result = ActiveSupport::HashWithIndifferentAccess.new(first_name: nil, last_name: nil, address: nil)
      end

      it "returns all attributes from event attribute with null value" do
        expect(@subject.custom_attributes_value).to eq(@result)
        @subject.custom_attributes = nil
        expect(@subject.custom_attributes_value).to eq(@result)
      end
      
      it "returns intersection elements between custom_attributes and EventAttribute" do
        @subject.custom_attributes[:first_name] = "some_value"
        @subject.custom_attributes[:last_name] = "some_value"
        @result[:first_name] = "some_value"
        @result[:last_name] = "some_value"
        expect(@subject.custom_attributes_value).to eq(@result)
      end

      it "returns all custom_attributes" do
        @subject.custom_attributes[:address] = "some_value"
        @result[:address] = "some_value"
        expect(@subject.custom_attributes_value).to eq(@result)
      end

      it "returns only EventAttributes" do
        @subject.custom_attributes[:address2] = "some_value"
        expect(@subject.custom_attributes_value).to eq(@result)
      end
    end
  end 
end
