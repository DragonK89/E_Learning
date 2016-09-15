class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :name
      t.string :subjects
      t.string :code
      t.string :start_date
      t.string :end_date
      t.string :class_time_start
      t.string :class_time_end
      t.string :image
      t.integer :limit_student_number
      t.string :description

      t.timestamps
    end
  end
end
