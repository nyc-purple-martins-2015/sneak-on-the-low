class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voteable, :polymorphic => true
      t.references :voter, index: true, foreign_key: true
      t.timestamps
    end
  end
end
