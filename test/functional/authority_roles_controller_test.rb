require 'test_helper'

class AuthorityRolesControllerTest < ActionController::TestCase
  setup do
    @authority_role = authority_roles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authority_roles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authority_role" do
    assert_difference('AuthorityRole.count') do
      post :create, :authority_role => @authority_role.attributes
    end

    assert_redirected_to authority_role_path(assigns(:authority_role))
  end

  test "should show authority_role" do
    get :show, :id => @authority_role.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @authority_role.to_param
    assert_response :success
  end

  test "should update authority_role" do
    put :update, :id => @authority_role.to_param, :authority_role => @authority_role.attributes
    assert_redirected_to authority_role_path(assigns(:authority_role))
  end

  test "should destroy authority_role" do
    assert_difference('AuthorityRole.count', -1) do
      delete :destroy, :id => @authority_role.to_param
    end

    assert_redirected_to authority_roles_path
  end
end
