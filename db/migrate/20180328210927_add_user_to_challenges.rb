class AddUserToChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :challenges, :challenge, :string
    add_reference :challenges, :user, foreign_key: true
  end
end
