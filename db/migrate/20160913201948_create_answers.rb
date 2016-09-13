class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.column :content, :string
      t.column :votes, :integer, :default => 0
      t.column :question_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
    add_column :questions, :title, :string
    add_column :users, :username, :string
  end
end
