class CreatePipes < ActiveRecord::Migration
  def change
  	create_tables :pipes do |t|
  		t.boolean :working, default: true
  		t.boolean :flowing, default: true
  		t.integer :a
  		t.integer :b
  		t.integer :c

  		t.timestamps
  	end
  end
end
