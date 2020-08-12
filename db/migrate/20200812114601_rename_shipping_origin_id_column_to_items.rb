class RenameShippingOriginIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_origin_id, :prefecture_id
  end
end
