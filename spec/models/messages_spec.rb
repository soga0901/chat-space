require 'rails_helper'
require 'faker'
require 'Set'

describe Message do
  let(:group) { create(:group) }
  let(:message) {create(:message)}
  let(:user) {create(:user)}

  describe '#create' do
    it "is valid with a body" do
      message = build(:message, group_id: group, user_id: user, body: "hellooooooooo")
      expect(message).to be_valid
    end

    it "is invalid without a body" do
       message = build(:message, group_id: group, user_id: user, body: "")
       message.valid?
       expect(message.errors[:body]).to include("を入力してください")
    end
  end
end
