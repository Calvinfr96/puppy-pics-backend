class AddUserAndDogToRatings < ActiveRecord::Migration[6.1]
  def change
    add_reference(:ratings, :user, foreign_key: true, null: false)
    add_reference(:ratings, :dog, foreign_key: true, null: false)
  end
end
