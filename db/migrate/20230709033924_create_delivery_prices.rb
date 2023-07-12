class CreateDeliveryPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_prices do |t|

      t.timestamps
    end
  end
end
