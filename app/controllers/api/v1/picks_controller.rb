module Api
  module V1
    class PicksController < Api::ApplicationController
      before_action :set_slack_channel, :set_slack_user

      def create
        @pick = Pick.create_for_user(@slack_user, params[:text])

        render text: "Submitted your pick! #{@pick.sports_team.uid} to win by #{@pick.wins_by} points"
      end

      private

      def set_slack_channel
        @slack_channel = SlackChannel.where(sid: params[:channel_id]).first_or_create(slack_team: current_slack_team, sports_type: params[:channel_name])
      end

      def set_slack_user
        @slack_user = @slack_channel.first_slack_user_or_create(params[:user_id], params[:user_name])
      end
    end
  end
end
