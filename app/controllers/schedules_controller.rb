class SchedulesController < ApplicationController

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        redirect_to schedules_path
      else
        render 'edit'
      end
    end
  end

  private
    def schedule_params
      params.require(:schedule).permit(:election_start_time, :election_end_time)
    end
end
