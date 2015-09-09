# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :enrollments,
    foreign_key: :student_id,
    primary_key: :id,
    class_name: "Enrollment"

  has_many :courses, through: :enrollments

  def enrolled_courses
    courses
  end
end
