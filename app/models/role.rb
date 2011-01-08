class Role
  extend ActiveModel::Naming  # needed to render form in edit view

  attr_accessor :name
  @@all = {}

  # This is used by belongs_to in AuthorityRoles, as well as its use
  # in RolesController
  def self.find_by_name(name, conditions=nil)
    @@all[name]
  end

  def self.all
    @@all.values
  end

  def initialize(name)
    @name = name
    @@all[name] = self
  end

  def authorities
    AuthorityRole.where(:role_name => self.name).collect {|ar| ar.authority}
  end

  # Imitates has_many :authorities, :through => :authority_roles, which
  # can't be done easily since this is not an ActiveRecord class
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
