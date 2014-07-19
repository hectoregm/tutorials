require 'rails_helper'

RSpec.describe Micropost, :type => :model do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Lorem ipsum")
  end

  subject { @micropost }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:user_id) }
  it { is_expected.to respond_to(:user) }
  it { expect(@micropost.user).to eq user }

  it { is_expected.to be_valid }

  describe "when user_id is not present" do
    before { @micropost.user_id = nil }
    it { is_expected.not_to be_valid }
  end
end
