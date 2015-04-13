class EmptestsController < ApplicationController
  before_action :set_emptest, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @emptests = Emptest.all
    respond_with(@emptests)
  end

  def show
    respond_with(@emptest)
  end

  def new
    @emptest = Emptest.new
    respond_with(@emptest)
  end

  def edit
  end

  def create
    @emptest = Emptest.new(emptest_params)
    @emptest.save
    respond_with(@emptest)
  end

  def update
    @emptest.update(emptest_params)
    respond_with(@emptest)
  end

  def destroy
    @emptest.destroy
    respond_with(@emptest)
  end

  def import
    begin
        Emptest.import(params[:file])
            redirect_to emptests_path, notice: "Data uploaded successfully"
    rescue
          redirect_to emptests_path, notice: "Invalid CSV file format."
      end
  end



  private
    def set_emptest
      @emptest = Emptest.find(params[:id])
    end

    def emptest_params
      params.require(:emptest).permit(:ecode, :name, :shift, :sintime, :aintime)
    end
end
