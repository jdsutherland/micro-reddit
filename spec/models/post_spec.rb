require 'rails_helper'

describe Post, type: :model do
  it { should belong_to(:user) }

  context 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }

    context 'uniqueness' do
      before { create(:post) }

      it { should validate_uniqueness_of(:title) }
    end
  end
end
