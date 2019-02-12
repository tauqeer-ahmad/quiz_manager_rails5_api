module Api
  module V1
    module ApiExceptions

      extend ActiveSupport::Concern

      included do
        rescue_from ActiveRecord::RecordNotFound do |e|
          render_404(e.message)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          unprocessable_entity(e.message)
        end

        rescue_from ActionController::ParameterMissing do |e|
          render_400(e.message)
        end
      end

    end
  end
end
