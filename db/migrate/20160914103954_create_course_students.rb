class CreateCourseStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :course_students do |t|
      t.integer :course_id
      t.integer :user_id
      t.boolean :completed

      t.timestamps
    end
  end
end
