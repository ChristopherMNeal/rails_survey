class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.column(:content, :string)
      
      t.timestamps()
    end
  end
end
