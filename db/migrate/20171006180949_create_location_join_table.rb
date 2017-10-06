class CreateLocationJoinTable < ActiveRecord::Migration
  def change
    create_join_table :locations, :location_groups do |t|
      t.index [:location_id, :location_group_id], unique: true, name: "location_groups_locations_unique"
    end

    add_foreign_key :location_groups_locations, :locations
    add_foreign_key :location_groups_locations, :location_groups
  end
end
