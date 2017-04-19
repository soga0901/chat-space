require 'rails_helper'
require 'faker'
require 'Set'

describe MessagesController do
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:message) { build(:message) }
  let(:message_params){{ body: message.body}}
  let(:message_params_no_body){{ body: nil}}

  describe 'GET #index' do
    before do
      login_user user
      get :index, params: { group_id: group }
    end

    it "assigns the requested group to @group" do
      expect(assigns(:group)).to eq group
    end
  end

  describe 'POST #create' do
    before do
      login_user user
    end

    context 'IF @message.save' do
      before do
        post :create, params: { group_id: group, message: message_params }
      end

      it 'redirect to group_messages_path' do
        expect(response).to redirect_to group_messages_path(group)
      end

      it 'flash[:notice] includes message' do
        expect(flash[:notice]).not_to be_empty
      end

    end

    context 'ELSE' do
      before do
        post :create, params: { group_id: group, message: message_params_no_body}
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end

      it 'flash[:alert] includes message' do
        expect(flash[:alert]).not_to be_empty
      end

    end
  end
end
