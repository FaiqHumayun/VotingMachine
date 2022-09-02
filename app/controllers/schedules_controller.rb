# frozen_string_literal: true

# SchedulesController
class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
  end

  def edit
    @schedule = Schedule.find_by(id: params[:id])
  end

  def update
    @schedule = Schedule.find_by(id: params[:id])
    if @schedule.update(schedule_params)
      flash[:alert] = 'Schedule edited'
      redirect_to schedules_path
    else
      flash[:notice] = @request.error.full_messages.to_sentence
      render 'edit'
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:election_start_time, :election_end_time)
  end
end
