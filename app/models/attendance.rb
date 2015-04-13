class Attendance < ActiveRecord::Base
	belongs_to :employee
	#attr_accessible :empid, :date, :intime, :outtime, :workinghour
	def self.upload(file)




	end




end
