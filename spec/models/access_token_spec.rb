require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  describe '#validations' do
    it 'should have valid factory' do
      expect(build(:access_token)).to be_valid
    end

    it 'should validate the presence of token' do
      access_token = build :access_token, token: nil
      expect(access_token).not_to be_valid
      expect(access_token.errors.messages[:token]).to include("can't be blank")
    end

    it 'should validate the uniqueness of token' do
      access_token = create :access_token
      invalid_token = build :access_token, token: access_token.token
      expect(invalid_token).not_to be_valid
    end
  end

  describe '#new' do
    it 'should have a token present after initialize' do
      expect(AccessToken.new.token).to be_present
    end

    it 'should generate uniq token' do
      user = create :user
      expect { user.create_access_token }.to change { AccessToken.count }.by(1)
      expect(user.build_access_token).to be_valid
    end

  end
end
