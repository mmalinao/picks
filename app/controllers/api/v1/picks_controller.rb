module Api
  module V1
    class PicksController < ApplicationController
      def create
        @slack_channel = SlackChannel.sports_channel_for(current_slack_team, params[:channel_id], params[:channel_name])
        # @slack_user = SlackUser.where(slack_team)
        # @pick = Pick.new()
        render json: { text: 'hello world!' }
      end
    end
  end
end
