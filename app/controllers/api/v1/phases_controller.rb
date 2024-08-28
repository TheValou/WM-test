class Api::V1::PhasesController < ApplicationController
  before_action :get_phases

  def index
    render json: @phases, status: 200
  end

  def get_notifications; end

  private

  def get_phases
    @phases = Phase.all
  end
end
