class Emptest < ActiveRecord::Base
	


	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			Emptest.create! row.to_hash
		end
	end
end
