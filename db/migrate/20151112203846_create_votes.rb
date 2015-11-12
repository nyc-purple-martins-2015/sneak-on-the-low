class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, :polymorphic => true
      t.reference :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
