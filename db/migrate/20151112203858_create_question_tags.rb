class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :questiontags do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps
    end
  end
end
