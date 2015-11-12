class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :commentable, :polymorphic => true
      t.references :commentor, index: true, foreign_key: true

      t.timestamps
    end
  end
end
