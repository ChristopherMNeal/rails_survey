require 'rails_helper'
describe Survey do
  it { should have_many(:questions) }
  it("has many songs") do
    survey = Survey.create(name: "survey1")
    q1 = Question.create(content: "question 1", survey_id: survey.id)
    q2 = Question.create(content: "question 2", survey_id: survey.id)
    expect(survey.questions()).to(eq([q1, q2]))
  end
end