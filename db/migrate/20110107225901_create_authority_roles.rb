class CreateAuthorityRoles < ActiveRecord::Migration
  def self.up
    create_table :authority_roles, :id => false do |t|
      t.string :role_name
      t.string :authority_name

      t.timestamps
    end
  end

  def self.down
    drop_table :authority_roles
  end
end
