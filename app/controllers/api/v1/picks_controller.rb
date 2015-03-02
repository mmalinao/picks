module Api
  module V1
    class PicksController < Api::ApplicationController
      def create
        @slack_channel = SlackChannel.sports_channel_for(current_slack_team, params[:channel_id], params[:channel_name])
        @slack_user = SlackUser.where(slack_id: params[:user_id], name: params[:user_name]).first_or_create
        # @slack_user = SlackUser.where(slack_team)
        # @pick = Pick.new()
        render json: { text: 'hello world!' }
      end
    end
  end
end
