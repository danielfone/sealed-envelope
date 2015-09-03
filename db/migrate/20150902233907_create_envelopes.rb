class CreateEnvelopes < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :envelopes do |t|
      t.uuid :uuid, null: false, default: 'uuid_generate_v4()', index: { unique: true }
      t.json :data
      t.text :contents
      t.string :name
      t.string :owner_email, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end

  end
end
