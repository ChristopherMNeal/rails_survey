class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  validate :name_requirements_are_met

  before_save(:titleize_survey)
  
  private 

  def titleize_survey
    self.name = self.name.titleize
  end

  def name_requirements_are_met
    rules = {
      " must contain at least one letter"  => /[a-zA-Z]+/
    }
    rules.each do |message, regex|
      # binding.pry
      errors.add( :name, message ) unless name.match( regex )
    end
  end
end
