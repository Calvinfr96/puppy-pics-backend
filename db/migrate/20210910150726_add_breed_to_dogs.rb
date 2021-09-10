class AddBreedToDogs < ActiveRecord::Migration[6.1]
  def change
    add_reference(:dogs, :breed, foreign_key: true, null: false)
  end
end
