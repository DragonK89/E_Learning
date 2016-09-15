class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :course_id
      t.string :name
      t.string :headlines
      t.string :tutorial
      t.string :video
      t.string :home_work
      t.string :note

      t.timestamps
    end
  end
end
