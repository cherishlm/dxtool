class CreateSetting < ActiveRecord::Migration
  def change
    create_table :settings do |t|
       t.string :key
       t.text :value
    end
  end
end
