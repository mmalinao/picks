module Api
  module V1
    class PicksController < ApplicationController
      before_action :authenticate_slack_team!

      def create
        # @slack_user = SlackUser.where(slack_team)
        # @pick = Pick.new()
      end

      private

      def permitted_params
        params.permit(:token, :team_id)
      end
    end
  end
end
