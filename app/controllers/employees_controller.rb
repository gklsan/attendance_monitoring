class EmployeesController < ApplicationController

  before_action :set_emp, only: [:show, :edit, :update, :destroy]


  def index
    @employees = Employee .all
  end
  
  def new
    @employee = Employee.new
  end

  def show
  end

  def edit
  end

  def create
      @employee = Employee.create(emp_params)
      if @employee.save
          redirect_to @employee, notice: 'Employee was successfully created.'
      else
        render action: "new"
      end
  end

  def destroy
    @employee.destroy
    redirect_to attendances_path
  end

  def update
      if @employee.update(emp_params)
        redirect_to @employee
      else
        render action: 'edit'
      end
  end 

  private
    def set_emp
      @employee = Employee.find(params[:id])
    end

    def emp_params
      params.require(:employee).permit(:name)
    end
end
