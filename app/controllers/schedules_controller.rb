# frozen_string_literal: true

# SchedulesController
class SchedulesController < ApplicationController
  before_action :find_schedule, only: %i[update edit]
  def index
    @schedules = Schedule.all
  end

  def edit; end

  def update
    if @schedule.update(schedule_params)
      flash[:alert] = 'Schedule edited'
      redirect_to schedules_path
    else
      flash[:notice] = @schedule.error.full_messages.to_sentence
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:election_start_time, :election_end_time)
  end

  def find_schedule
    @schedule = Schedule.find_by(id: params[:id])
  end
end
