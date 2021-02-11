require 'rails_helper'

describe User do
  it { should have_many(:posts) }

  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:encrypted_password) }

    context 'uniqueness' do
      before { create(:user) }

      it { should validate_uniqueness_of(:username) }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
