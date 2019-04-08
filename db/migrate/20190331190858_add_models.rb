class AddModels < ActiveRecord::Migration[5.2]
  def change
    create_table :shopify_shops do |t|
      t.string :domain
      t.string :currency

      t.timestamps
    end

    create_table :user_sessions do |t|
      t.string :session_id
      t.integer :shopify_shop_id
      t.float :value, default: 0
      t.float :value_usd, default: 0
      t.integer :item_count, default: 0

      t.timestamps
    end
  end
end
