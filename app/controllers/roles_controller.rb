class RolesController < ApplicationController
  # GET /roles
  # GET /roles.xml
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @roles }
    end
  end

  # GET /roles/Admin
  # GET /roles/Admin.xml
  def show
    @role = Role.find_by_name(params[:name])
    @role_authorities = @role.authorities
    @all_authorities = Authority.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  # GET /roles/Admin/edit
  def edit
    @role = Role.find_by_name(params[:name])
    @all_authorities = Authority.all
  end

  # PUT /roles/Admin
  # PUT /roles/Admin.xml
  def update
    @role = Role.find_by_name(params[:name])

    respond_to do |format|
      @role.authorities = Authority.find_by_name(params[:authority_names])
      format.html { redirect_to(role_path(@role.name),
           :notice => 'Role was successfully updated.') }
      format.xml  { head :ok }
    end
  end

end
