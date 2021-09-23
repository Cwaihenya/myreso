require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Search by the address sent by the argument and create or find User' do
    let!(:created_user) { User.create(email: 'created_user@example.com', password: '199392199392') }
    let!(:not_created_user) { User.find_or_create_by_email('not_created_user@example.com') }

    it 'If there is a User who has the address sent as an argument, find that User and return the instance as a return value' do
      expect(User.find_or_create_by email('created_user@example.com')).to eq created_user
    end

    it 'If no User has the address sent as an argument, create a User and return that instance' do
      expect(not_created_user.persisted?).to eq true
      expect(not_created_user.encrypted_password.present?).to eq true
    end
  end
end
