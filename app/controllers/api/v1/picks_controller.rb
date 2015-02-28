module Api
  module V1
    class PicksController < ApplicationController
      before_action :authorize_pick!

      def create
        raise params.inspect
      end

      private

      def permitted_params
      end

      def authorize_pick!
        # respond 400
      end
    end
  end
end
