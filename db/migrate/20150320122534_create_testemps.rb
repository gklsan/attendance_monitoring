class CreateTestemps < ActiveRecord::Migration
  def change
    create_table :testemps do |t|
      t.integer :empid
      t.string :name
      t.datetime :hour

      t.timestamps
    end
  end
end
