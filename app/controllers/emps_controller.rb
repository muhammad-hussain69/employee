class EmpsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show, :new, :destroy]

  def index
    @emps = Emp.all
  end

  def new
    @emp = Emp.new
  end

  def show
    @emp = Emp.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Record not found.'
  end
  def about

  end

  def create
    #@emp = emp.new(emp_params)
    @emp = current_emp.build(emp_params)

    respond_to do |format|
      if @emp.save
        format.html { redirect_to emp_url(@emp), notice: "Employee was successfully created." }
        format.json { render :show, status: :created, location: @emp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @emp.destroy

    respond_to do |format|
      format.html { redirect_to emps_url, notice: "Employee was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    role = current_user.role
    redirect_to emps_path, notice: "NOT Authorized to Edit this Employee" if role != ('Admin' || 'admin')
  end

  private
  def set_emp
    @emp = Emp.find(params[:id])
  end

  def emp_params
    params.require(:emp).permit(:first_name, :last_name, :email, :phone, :role)
  end
end
