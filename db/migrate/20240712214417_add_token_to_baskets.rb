class AddTokenToBaskets < ActiveRecord::Migration[7.1]
  def change
    add_column :baskets, :token, :string
  end
end
