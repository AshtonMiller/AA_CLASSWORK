# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  instructor_id :integer
#  prereq_id     :integer
#

class Course < ApplicationRecord
  validates :name, presence: true
  # validates :prereq_id, presence: false 

  belongs_to :prerequisite,   
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course,
    optional: true


  has_many :enrollments,    #this is from belongs_to in course #1
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :enrolled_students,
    through: :enrollments,
    source: :user
  # has_many :enrolled_students,
  #   primary_key: :id,
  #   foreign_key: :student_id,
  #   class_name: :Enrollment



  belongs_to :instructor,   #3
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :User

end
