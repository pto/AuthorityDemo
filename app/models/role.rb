class Role
  extend ActiveModel::Naming
  include ActiveModel::AttributeMethods
  include ActiveRecord::AttributeMethods::PrimaryKey
  include ActiveRecord::AttributeMethods::PrimaryKey::ClassMethods
    set_primary_key :name
  def persisted?
    true
  end

  attr_accessor :name
  @@all_roles = {}

  def self.find_by_name(name, conditions=nil)
    @@all_roles[name]
  end

  def self.all
    @@all_roles.values
  end

  def initialize(name)
    @name = name
    @@all_roles[name] = self
  end

  def authorities
    AuthorityRole.where(:role_name => self.name).collect {|ar| ar.authority}
  end

  def authorities=(authorities)
    AuthorityRole.delete_all(:role_name => self.name)
    if authorities
      for authority in authorities
        AuthorityRole.new(:role_name => self.name,
                          :authority_name => authority.name).save
      end
    end
  end

  self.new "Admin"
  self.new "Reports"
  self.new "CSR"
end
