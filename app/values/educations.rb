module Educations
  EDUCATION_TYPES = {
    high_school: 0,
    college: 1,
    university: 2
  }.freeze
  private_constant :EDUCATION_TYPES

  def self.enum
    EDUCATION_TYPES
  end
end
