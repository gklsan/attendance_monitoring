class TestempsController < ApplicationController

	

  def index
    
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end



  def upload
    @records = []
    records = params[:file].path
    @records = CSV.foreach(records, headers:true)
  end

end





