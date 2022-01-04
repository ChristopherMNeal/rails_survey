class Question < ApplicationRecord
  belongs_to :survey
  validates :content, presence: true
  validates_length_of :content, maximum: 250
  validate :content_requirements_are_met
  before_save(:titlecase_question)
  
  private 
  def titlecase_question
    self.content = self.content[0].upcase + self.content.slice(1,self.content.length)
  end
  
  def content_requirements_are_met
    rules = {
      " must contain at least one letter"  => /[a-zA-Z]+/
    }

    rules.each do |message, regex|
      errors.add( :content, message ) unless content.match( regex )
    end
  end
end