require 'rails_helper'
require 'pry'
describe Survey do
  it { should have_many(:questions) }
  it("has many songs") do
    survey = Survey.create(name: "survey1")
    q1 = Question.create(content: "question 1", survey_id: survey.id)
    q2 = Question.create(content: "question 2", survey_id: survey.id)
    expect(survey.questions()).to(eq([q1, q2]))
  end
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }

  # it { should validate :name_requirements_are_met }
  it("will make sure the name contains a letter") do
    survey = Survey.create({name: "88888"})
    # binding.pry
    expect(survey.name()).not_to eql("88888")
  end

  it("will not create survey if no letters are present") do
    survey = Survey.create({name: ""})
    
    expect(survey.errors.full_messages).to(eq(["Name can't be blank"]))
  end
  it("titleizes the name of a survey") do
    s = Survey.create({name: "giant steps"})
    expect(s.name()).to(eq("Giant Steps"))
  end
end

