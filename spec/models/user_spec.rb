require 'rails_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    context 'uniqueness' do
      before :each do
        User.create(username: 'Bob', email: 'bob@example.com', password: 'password')
      end

      it { should validate_uniqueness_of(:username) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
