class ChangeGoodBoyToBoolean < ActiveRecord::Migration[6.1]
  def change
    remove_column(:ratings, :good_boy?)
    add_column(:ratings, :good_boy?, :boolean)
  end
end
