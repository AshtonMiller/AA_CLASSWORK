# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  student_id :integer
#




class Enrollment < ApplicationRecord

  # validates :course_id, presence: true  #commented because line 29 is doing this
  # validates :student_id, presence: true
    
  
  
  # has_many :users,
  #   primary_key: :id,
  #   foreign_key: :user_id,
  #   class_name: :Enrollment

  belongs_to :course,   # this association is #1 points to has_many in enrollments in course 
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Course

  belongs_to :user,   # this one points to enrollments in user #2 
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :User 
  

end
