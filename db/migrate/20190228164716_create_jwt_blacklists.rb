class CreateJwtBlacklists < ActiveRecord::Migration[5.2]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti, null: false, index: true
      t.datetime :exp, null: false
    end
  end
end
