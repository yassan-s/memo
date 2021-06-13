class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      # references
      # → 対応する外部キーを自動でもってくる
      t.references :user, null: false, foreign_key: true
      t.references :tweet, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
