require 'rails_helper'

RSpec.describe Api::V1::PicksController, type: :controller do
  describe 'POST #create' do
    subject(:do_post) { post :create, params }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let!(:slack_channel) { FactoryGirl.create(:slack_channel) }
    let(:params) { FactoryGirl.build(:slash_command, token: token, channel_id: channel_id) }

    let(:token) { slack_team.token }
    let(:channel_id) { slack_channel.slack_id }

    context 'when authentication failed' do
      let(:token) { 'foo' }

      it 'should return 401' do
        do_post
        expect(response.status).to eq 401
      end

      it 'should return error message' do
        do_post
        expect(json_error).to eq 'Access Denied'
      end
    end
  end
end
