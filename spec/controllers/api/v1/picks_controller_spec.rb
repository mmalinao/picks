require 'rails_helper'

RSpec.describe Api::V1::PicksController, type: :controller do
  describe 'POST #create' do
    subject(:do_post) { post :create, params }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let!(:slack_channel) { FactoryGirl.create(:slack_channel, slack_team: slack_team) }
    let(:params) { FactoryGirl.build(:slash_command, team_id: slack_team.slack_id, token: token, channel_id: slack_channel.slack_id) }

    let(:token) { slack_team.token }

    it 'should assign @slack_channel' do
      do_post
      expect(assigns(:slack_channel)).to eq slack_channel
    end

    it 'should create a new Pick' do
      expect { do_post }.to change { Pick.count }.by(1)
    end

    it 'should assign @pick' do
      do_post
      expect(assigns(:pick)).to be_kind_of Pick
    end

    it 'should return 200' do
      do_post
      expect(response.status).to eq 200
    end

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

    # context 'when slack channel does not exist under slack team' do
    #   let(:channel_id) { 'foo' }

    #   # it 'should create a new SlackChannel' do
    #   #   expect { do_post }.to change { SlackChannel.count }.by(1)
    #   # end

    #   it 'should assign @slack_channel' do
    #     do_post
    #     expect(assigns(:slack_channel)).to_not be_nil
    #   end
    # end
  end
end
