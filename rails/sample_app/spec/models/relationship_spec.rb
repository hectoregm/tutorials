require 'rails_helper'

RSpec.describe Relationship, :type => :model do
  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }

  describe "follower methods" do
    it { is_expected.to respond_to(:follower) }
    it { is_expected.to respond_to(:followed) }
    it { expect(relationship.follower).to eq follower }
    it { expect(relationship.followed).to eq followed }
  end

  describe "when a followed id is not present" do
    before { relationship.followed_id = nil }
    it { is_expected.to_not be_valid }
  end

  describe "when a follower id is not present" do
    before { relationship.follower_id = nil }
    it { is_expected.to_not be_valid }
  end

end
