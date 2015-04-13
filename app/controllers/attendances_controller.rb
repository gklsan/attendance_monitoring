class AttendancesController < ApplicationController

	before_action :authenticate_login!

	def index

    	@attendances = Attendance.all
    	@employees =Employee.order('id ASC').all

	end

	   	def show
   		#@attendance = Attendance.(params[:id])
   		#redirect_to dateselect_attendances_path   		
   	end

   	def dateselect
   		@fromdate = params[:fromdate]
   		@todate = params[:todate]
   		@selectdata = params[:selectdata]
   		@empname = params[:empname]
   		if @fromdate != nil && @todate != nil && @selectdata.eql?("alldata")
   			@dateselect = Employee.joins(:attendances).select('date, name,employee_id, intime, outtime, workinghour, status').where('date >= ? and date <= ?',@fromdate,@todate)
   		
   		elsif @fromdate != nil && @todate != nil && @selectdata.eql?("leavedata")
   			@dateselect = Employee.joins(:attendances).select('date, name, employee_id, intime, outtime, workinghour, status').where('date >= ? and date <= ? and status = ?',@fromdate,@todate,"Absent")
   		
   		#elsif @fromdate != nil && @todate != nil && @empname != nil && @selectdata != "leavedata"
   		#	@empselect = Employee.joins(:attendances).select('date, name, employee_id, intime, outtime, workinghour, status').where('date >= ? and date <= ? and name = ? and status = ?',@fromdate,@todate,@empname,"Absent")

   		elsif @fromdate != nil && @todate != nil && @empname != nil && @selectdata != "leavedata"
   			@empselect = Employee.joins(:attendances).select('date, name, employee_id, intime, outtime, workinghour, status').where('date >= ? and date <= ? and name = ?',@fromdate,@todate,@empname)


   		end
   	end

   

	def upload
		# find all models and group them on keys which should be common
		groupall = Attendance.all.group_by{|attendence| [attendence.date]}
		groupall.values.each do |duplicates|
			# the first one we want to keep right?
			#first_one = duplicates.shift
			# if there are any more left, they are duplicates
			# so delete all of them
			duplicates.each{|repeat| repeat.destroy} # duplicates can now be destroyed
		end



		file = params[:file].read
	        CSV.parse(file, {:headers => true}) do |row|


		        if row[5]
		        	@daterow = row[5]
				end
				unless row[2].nil? && row[3].nil?
					unless row[9].eql?("A. InTime")
			     	    if row[9].nil? || row[11].nil?
			     	       	workinghours = '-'
			     	       	status = "Absent"
			     	    else
							work = Time.diff(Time.parse(row[9]),Time.parse(row[11]))
							workinghours = work[:diff]
							status = "Present"
			     	   	end
			      	   	attend = Attendance.create(employee_id: row[2], date: row[5], intime: row[9], outtime: row[11], :workinghour => workinghours, status: status)
						attend.save
			    	end
		        end
		    end
     	    redirect_to attendances_path, notice: "Data uploaded successfully"     
	end
	
end
