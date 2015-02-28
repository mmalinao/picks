class ApplicationController < ActionController::API
  include ActionController::Serialization
  respond_to :json

  private

  def access_denied!(msg = "Access Denied")
    render json: { error: msg }, status: 401
  end

  def current_slack_team
    @current_slack_team
  end

  def authenticate_slack_team!
    @current_slack_team = SlackTeam.authenticate_with_token(params[:team_id], params[:token])
    access_denied! if @current_slack_team.nil?
  end
end
