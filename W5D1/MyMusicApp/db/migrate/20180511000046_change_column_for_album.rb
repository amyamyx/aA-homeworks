class ChangeColumnForAlbum < ActiveRecord::Migration[5.1]
  def change
    rename_column :albums, :live?, :studio
  end
end
