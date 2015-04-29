class AddDesciptionToSetting < ActiveRecord::Migration
  def change
    add_column :settings,:description,:string 
  end
end
