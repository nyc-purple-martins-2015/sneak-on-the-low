class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content, null: false
      t.boolean :best, default: false
      t.references :user, index: true
      t.references :question, index: true
      t.timestamps
    end
  end
end
