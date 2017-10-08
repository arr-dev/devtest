class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :token, index: { unique: true }

      t.timestamps null: false
    end

    add_index :api_keys, :created_at
  end
end
