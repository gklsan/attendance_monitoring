class CreateEmptests < ActiveRecord::Migration
  def change
    create_table :emptests do |t|
      t.integer :ecode
      t.string :name
      t.string :shift
      t.time :sintime
      t.time :aintime

      t.timestamps
    end
  end
end
