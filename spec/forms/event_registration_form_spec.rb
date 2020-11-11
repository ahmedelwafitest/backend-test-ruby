require 'rails_helper'

RSpec.describe EventRegistrationForm, type: :form do
  before(:each) do
    @event = create(:event)
    @user = create(:user)
    user_attributes_name = create(:event_attribute, :text, :required, name: 'name', event: @event)
    user_attributes_active = create(:event_attribute, :boolean, name: 'active', event: @event)
  end

  describe 'validations' do

    it 'validates form successufully' do
      params = {name: 'test'}
      form = described_class.new(@user.id, @event.id, params)
      expect(form).to be_valid
    end

    it 'fails to validate the form' do
      params = {active: true}
      form = described_class.new(@user.id, @event.id, params)
      expect(form).to be_invalid
    end

    it 'validates boolean data_type' do
      params = {active: 't'}
      form = described_class.new(@user.id, @event.id, params)
      expect(form.active).to be true
    end

  end

  describe '#save' do
  	it 'return true' do
      params = {name: 'test', active: 't'}
      form = described_class.new(@user.id, @event.id, params)
  	  expect(form.save).to be true
  	end
  end
end
