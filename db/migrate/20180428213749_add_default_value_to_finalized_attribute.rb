class AddDefaultValueToFinalizedAttribute < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :finalized, :boolean, default: false
  end
end
