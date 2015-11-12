class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :content, null: false
      t.reference :user, index: true, foreign_key: true


      t.timestamps
    end
  end
end
