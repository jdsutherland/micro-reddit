require 'rails_helper'

describe User do
  it { should have_many(:posts) }
  it { should have_many(:comments) }

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }

    it { should validate_length_of(:username).is_at_least(4).is_at_most(12) }
    it { should validate_length_of(:encrypted_password).is_at_least(6).is_at_most(16) }

    context 'uniqueness' do
      before { create(:user) }

      it { should validate_uniqueness_of(:username) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
