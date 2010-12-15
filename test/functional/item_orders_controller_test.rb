require 'test_helper'

class ItemOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_order" do
    assert_difference('ItemOrder.count') do
      post :create, :item_order => { }
    end

    assert_redirected_to item_order_path(assigns(:item_order))
  end

  test "should show item_order" do
    get :show, :id => item_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => item_orders(:one).to_param
    assert_response :success
  end

  test "should update item_order" do
    put :update, :id => item_orders(:one).to_param, :item_order => { }
    assert_redirected_to item_order_path(assigns(:item_order))
  end

  test "should destroy item_order" do
    assert_difference('ItemOrder.count', -1) do
      delete :destroy, :id => item_orders(:one).to_param
    end

    assert_redirected_to item_orders_path
  end
end
