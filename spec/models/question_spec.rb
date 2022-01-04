require 'rails_helper'

describe Question do
  it { should belong_to(:survey) }
  it { should validate_presence_of :content }
  it { should validate_length_of(:content).is_at_most(250) }
end
