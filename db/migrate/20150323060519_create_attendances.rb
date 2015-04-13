class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.integer :empid
      t.date :date
      t.time :intime
      t.time :outtime

      t.timestamps
    end
  end
end
