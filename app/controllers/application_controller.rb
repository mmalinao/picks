class ApplicationController < ActionController::API
  include ActionController::Serialization
  respond_with :json
end
