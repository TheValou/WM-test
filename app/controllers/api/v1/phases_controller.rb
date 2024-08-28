class Api::V1::PhasesController < ApplicationController
  before_action :get_phases

  def index
    render json: @phases, status: 200
  end

  def get_notifications
    phase = params[:phase_id].present? ? Phase.find_by_name(params[:phase_id]) : Phase.all.sample
    current_date = params[:current_date].to_datetime
    current_moment = get_moment_from_date(current_date)
    notif = phase.notifications.where(moment: current_moment).order(priority: :asc).first&.messages&.sample
    notif ||= 'No notifications !'
    render json: notif, status: 200
  end

  private

  def should_send_notifications?(phase); end

  def get_moment_from_date(datetime)
    return :morning if (0..11).include?(datetime.hour)
    return :noon if datetime.hour == 12

    :evening if (13..21).include?(datetime.hour)
  end

  def get_phases
    @phases = Phase.all
  end
end
