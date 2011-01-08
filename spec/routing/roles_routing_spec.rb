require "spec_helper"

describe RolesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/roles" }.should route_to(:controller => "roles", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/roles/Admin" }.should route_to(:controller => "roles", :action => "show", :name => "Admin")
    end

    it "recognizes and generates #edit" do
      { :get => "/roles/Admin/edit" }.should route_to(:controller => "roles", :action => "edit", :name => "Admin")
    end

    it "recognizes and generates #update" do
      { :put => "/roles/Admin" }.should route_to(:controller => "roles", :action => "update", :name => "Admin")
    end

  end
end
