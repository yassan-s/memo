class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end