require 'rails_helper'
require 'faker'
require 'Set'

describe MessagesController do
  let(:group) { create(:group) }
  let(:message) { create(:message) }
  let(:user) { create(:user) }
  let(:message) { attribute_for(:message)}

  describe 'GET #index' do
    before do
      get :index, group_id: group
    end

    it "@groupが期待される値を持つ" do
      expect(assigns(:group)).to eq group
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    it "@messageが期待された値を持つ" do
      post :create
      expect(assigns(:message)).to eq message
    end
  end
end
