class CreateGolfCourse < ActiveRecord::Migration[5.2]
  def change
    create_table :golf_courses do |t|
      t.string :name
      t.integer :holes
      t.boolean :public
      
      t.timestamps
    end
  end
end
