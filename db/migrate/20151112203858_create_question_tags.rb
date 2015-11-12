class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :questiontags do |t|
      t.reference :question, index: true, foreign_key: true
      t.reference :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
