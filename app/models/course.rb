class Course < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :course_students

  validates :subjects, presence: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :code, presence: true, uniqueness: {case_sensitive: true}
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :class_time_start, presence: true
  validates :class_time_end, presence: true
  validates_numericality_of :limit_student_number, presence: true
end
