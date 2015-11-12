class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.reference :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
