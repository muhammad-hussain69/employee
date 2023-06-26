class AttendancesController < ApplicationController

  def index
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      redirect_to attendances_path, notice: 'Attendance marked successfully.'
    else
      render :new
    end
  end

  private

  def attendance_params
    params.require(:attendance).permit(:date, :status)
  end
end
