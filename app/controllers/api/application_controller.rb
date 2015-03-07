module Api
  class ApplicationController < ActionController::API
    include ActionController::Serialization
    before_action :authenticate_slack_team!
    respond_to :json, :text

    rescue_from PickError::InvalidCommand, with: :invalid_command!
    rescue_from PickError::SportsTeamNotFound, with: :sports_team_not_found!
    rescue_from PickError::SportsTeamNotScheduled, with: :sports_team_not_scheduled!

    private

    def access_denied!(msg = "Access Denied")
      render json: { error: msg }, status: 401
    end

    def current_slack_team
      @current_slack_team
    end

    def authenticate_slack_team!
      @current_slack_team = SlackTeam.authenticate_with_token(params[:team_domain], params[:token])
      access_denied! if @current_slack_team.nil?
    end

    def invalid_command!
      render text: "Sorry, I didn't understand your command", status: 200
    end

    def sports_team_not_found!
      render text: "Sorry, I didn't recognize that team", status: 200
    end

    def sports_team_not_scheduled!
      render text: "Sorry, I don't see that team scheduled to play today", status: 200
    end
  end
end
