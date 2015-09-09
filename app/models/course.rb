# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Course < ActiveRecord::Base
  has_many :enrollments,
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

    has_many :users, through: :enrollments

    def enrolled_students
      users
    end

    belongs_to :prerequisite,
      primary_key: :id,
      foreign_key: :prereq_id,
      class_name: "Course"
end
