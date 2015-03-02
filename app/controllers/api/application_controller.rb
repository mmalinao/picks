module Api
  class ApplicationController < ActionController::API
    include ActionController::Serialization
    before_action :authenticate_slack_team!
    respond_to :json, :text

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
  end
end
