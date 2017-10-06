class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|

      t.string :country_code, index: { unique: true }
      t.references :panel_provider, index: true
      t.timestamps null: false
    end

    add_foreign_key :countries, :panel_providers
  end
end
