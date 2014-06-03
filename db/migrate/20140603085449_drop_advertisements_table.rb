class DropAdvertisementsTable < ActiveRecord::Migration
  def up
    drop_table :advertisements
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
