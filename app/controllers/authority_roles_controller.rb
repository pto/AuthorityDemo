class AuthorityRolesController < ApplicationController
  # GET /authority_roles
  # GET /authority_roles.xml
  def index
    @authority_roles = AuthorityRole.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authority_roles }
    end
  end

  # GET /authority_roles/1
  # GET /authority_roles/1.xml
  def show
    @authority_role = AuthorityRole.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @authority_role }
    end
  end

  # GET /authority_roles/new
  # GET /authority_roles/new.xml
  def new
    @authority_role = AuthorityRole.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @authority_role }
    end
  end

  # GET /authority_roles/1/edit
  def edit
    @authority_role = AuthorityRole.find(params[:id])
  end

  # POST /authority_roles
  # POST /authority_roles.xml
  def create
    @authority_role = AuthorityRole.new(params[:authority_role])

    respond_to do |format|
      if @authority_role.save
        format.html { redirect_to(@authority_role, :notice => 'Authority role was successfully created.') }
        format.xml  { render :xml => @authority_role, :status => :created, :location => @authority_role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @authority_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authority_roles/1
  # PUT /authority_roles/1.xml
  def update
    @authority_role = AuthorityRole.find(params[:id])

    respond_to do |format|
      if @authority_role.update_attributes(params[:authority_role])
        format.html { redirect_to(@authority_role, :notice => 'Authority role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @authority_role.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authority_roles/1
  # DELETE /authority_roles/1.xml
  def destroy
    @authority_role = AuthorityRole.find(params[:id])
    @authority_role.destroy

    respond_to do |format|
      format.html { redirect_to(authority_roles_url) }
      format.xml  { head :ok }
    end
  end
end
