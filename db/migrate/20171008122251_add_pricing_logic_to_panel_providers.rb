class AddPricingLogicToPanelProviders < ActiveRecord::Migration
  def change
    add_column :panel_providers, :pricing_logic, :string
  end
end
