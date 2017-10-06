class CreateCountryTargetGroupJoinTable < ActiveRecord::Migration
  def change
    create_join_table :countries, :target_groups do |t|
      t.index [:country_id, :target_group_id], unique: true
    end

    add_foreign_key :countries_target_groups, :countries
    add_foreign_key :countries_target_groups, :target_groups
  end
end
