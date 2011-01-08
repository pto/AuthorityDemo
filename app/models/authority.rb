class Authority
  attr_reader :name, :group
  @@all = {}

  def self.find_by_name(name, conditions=nil)
    if name.class == Array
      @@all.values.select {|a| name.include? a.name}
    else
      @@all[name]
    end  
  end

  def self.all
    @@all.values
  end

  def initialize(name, group)
    @name = name
    @group = group
    @@all[name] = self
  end

  self.new "Create User", "Users"
  self.new "Delete User", "Users"
  self.new "Update User", "Users"
  self.new "View Reports", "Reports"
end
