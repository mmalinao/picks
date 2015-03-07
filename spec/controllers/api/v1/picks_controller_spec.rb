require 'rails_helper'

RSpec.describe Api::V1::PicksController, type: :controller do
  describe 'POST #create' do
    subject(:do_post) { post :create, params }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let!(:slack_channel) { FactoryGirl.create(:slack_channel, slack_team: slack_team) }
    let!(:slack_user) do
      u = slack_channel.slack_users.build FactoryGirl.attributes_for(:slack_user)
      u.save
      u
    end

    let!(:nba_team) { FactoryGirl.create(:nba_team, :scheduled_tonight, uid: 'LAC') }

    let(:params) do
      FactoryGirl.build(:slash_command,
                        token: token,
                        team_domain: slack_team.domain,
                        channel_id: slack_channel.sid,
                        channel_name: slack_channel.sports_type,
                        user_id: slack_user.sid,
                        user_name: slack_user.name,
                        text: "LAC by 10"
      )
    end

    let(:token) { slack_team.token }

    it 'should assign @slack_channel' do
      do_post
      expect(assigns(:slack_channel)).to eq slack_channel
    end

    it 'should not create a new SlackChannel' do
      expect { do_post }.to_not change { SlackChannel.count }
    end

    it 'should assign @slack_user' do
      do_post
      expect(assigns(:slack_user)).to eq slack_user
    end

    it 'should not create a new SlackUser' do
      expect { do_post }.to_not change { SlackUser.count }
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

    it 'should return success message to Slack' do
      do_post
      expect(response.body).to match(/Submitted your pick!/)
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

      it 'should not create a new Pick' do
        expect { do_post }.to_not change { Pick.count }
      end
    end

    context 'when slack channel does not exist' do
      let(:slack_channel) { FactoryGirl.build(:slack_channel) }
      let(:new_slack_channel) { SlackChannel.last }

      it 'should create a new SlackChannel' do
        expect { do_post }.to change { SlackChannel.count }.by(1)
      end

      it 'should create a new SlackChannel with given params' do
        do_post
        expect(new_slack_channel).to have_attributes sid: params[:channel_id], sports_type: params[:channel_name]
      end

      it 'should create a new SlackChannel associated with SlackTeam' do
        do_post
        expect(new_slack_channel.slack_team).to eq slack_team
      end
    end

    context 'when PickError::InvalidCommand raised' do
      before(:each) { allow(Pick).to receive(:create_for_user).and_raise PickError::InvalidCommand }

      it 'should return 200' do
        do_post
        expect(response.status).to eq 200
      end

      it 'should return error message to Slack' do
        do_post
        expect(response.body).to match(/didn't understand your command/)
      end
    end

    context 'when PickError::SportsTeamNotFound raised' do
      before(:each) { allow(Pick).to receive(:create_for_user).and_raise PickError::SportsTeamNotFound }

      it 'should return 200' do
        do_post
        expect(response.status).to eq 200
      end

      it 'should return error message to Slack' do
        do_post
        expect(response.body).to match(/didn't recognize that team/)
      end
    end

    context 'when PickError::SportsTeamNotScheduled raised' do
      before(:each) { allow(Pick).to receive(:create_for_user).and_raise PickError::SportsTeamNotScheduled }

      it 'should return 200' do
        do_post
        expect(response.status).to eq 200
      end

      it 'should return error message to Slack' do
        do_post
        expect(response.body).to match(/don't see that team scheduled to play today/)
      end
    end
  end
end
