class Api::V1::VueController < ApiController
  before_action :set_emloyee, only: [:show]

rescue_from ActiveRecord::RecordNotFound do |exception|
  render json: { error: '404 not found' }, status: 404
end


