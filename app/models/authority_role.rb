class AuthorityRole < ActiveRecord::Base
  belongs_to :role, :primary_key => :name, :foreign_key => :role_name
  belongs_to :authority, :primary_key => :name, :foreign_key => :authority_name
end
