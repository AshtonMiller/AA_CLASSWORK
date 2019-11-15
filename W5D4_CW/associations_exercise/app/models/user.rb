# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :name, presence: true

  has_many :enrollments,  #this one points to belongs_to in enrollment #2  
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment


  has_many :enrolled_courses,    
    through: :enrollments, # from line 14 
    source: :course      # course is coming from our belongs_to in enrollment
    
  has_many :taught_courses,    #3
    primary_key: :id,
    foreign_key: :instructor_id,
    class_name: :Course

end
