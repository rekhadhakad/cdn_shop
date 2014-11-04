class CreateRatings < ActiveRecord::Migration
  def change
    create_table :spree_ratings do |t|
      t.references :product, index: true
      t.references :user, index: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
