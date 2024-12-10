class AddTimestampsToPostImages < ActiveRecord::Migration[6.1]
  def change
    change_table :post_images do |t|
      t.datetime :created_at, null: true
      t.datetime :updated_at, null: true
    end
  end
end