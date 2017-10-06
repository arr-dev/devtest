class CreateTargetGroups < ActiveRecord::Migration
  def change
    create_table :target_groups do |t|
      t.string :name
      t.string :external_id
      t.references :parent, index: true
      t.string :secret_code
      t.references :panel_provider, index: true

      t.timestamps null: false
    end

    add_foreign_key :target_groups, :panel_providers
    add_foreign_key :target_groups, :target_groups, column: :parent_id
  end
end
