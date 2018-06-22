class DropAdvertisementsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :advertisements
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
