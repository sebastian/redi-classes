class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :name
      t.integer :balance

      t.timestamps
    end
  end
end
