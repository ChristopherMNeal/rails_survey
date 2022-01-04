class AddForeignKeyForQuestions < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :questions, :surveys
  end
end
