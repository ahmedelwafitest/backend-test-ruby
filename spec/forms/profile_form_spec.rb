require 'rails_helper'

RSpec.describe ProfileForm, type: :form do
  before(:each) do
    @user = create(:user)

    user_attributes_name = create(:user_attribute, :text, :profilerequired, name: 'name')
    user_attributes_active = create(:user_attribute, :boolean, name: 'active')
  end
      
  describe 'validations' do

    it 'validates form successufully' do
      params = {name: 'test'}
      form = described_class.new(@user, params)
      expect(form).to be_valid
    end

    it 'fails to validate the form' do
      params = {active: true}
      form = described_class.new(@user, params)
      expect(form).to be_invalid
    end

    it 'validates boolean data_type' do
      params = {active: 't'}
      form = described_class.new(@user, params)
      expect(form.active).to be true
    end

  end

  describe '#save' do
  	it 'return true' do
      params = {name: 'test', active: 't'}
      form = described_class.new(@user, params)
  	  expect(form.save).to be true
  	end
  end
end
