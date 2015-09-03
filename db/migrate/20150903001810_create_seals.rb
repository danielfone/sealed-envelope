class CreateSeals < ActiveRecord::Migration
  def change
    create_table :seals do |t|
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()', index: { unique: true }
      t.references :envelope, index: true, foreign_key: true
      t.string :name, null: false
      t.string :token
      t.boolean :sealed, null: false, default: true
      t.datetime :opened_at

      t.timestamps null: false
    end
  end
end
