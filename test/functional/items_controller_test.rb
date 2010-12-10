require 'test_helper'
require File.dirname(__FILE__) + "/../factories"

class ItemsControllerTest < ActionController::TestCase

  context "placing the new item and item name and price" do
		setup do
			@item = Factory.create(:item)
		end
    should "not be empty" do
			assert_equal 'Apple', @item.name
      assert_equal '22', @item.price
		end
  end

	context "Place order response" do
		setup do
			@item = Factory.create(:item)
			@item1 = Factory.create(:item1)
		end

		should "return 200" do
			get :selected_item, {"item"=>["#{@item.name}_#{@item.price}", "#{@item1.name}_#{@item1.price}"]}
      assert_response :ok
		end

		should "return to root if there is no items selected" do
			get :selected_item, {}
      assert_redirected_to "/"
		end

		should "return 200 after clicking the checkout button" do
			get :place_order, {}
			assert_response :ok
		end
	end

  context "list items" do
    should "list all the items" do
      get :index 
      assert_response 200
    end
  end

  context "new items" do

     should "create new item" do
       get :new
       assert_response 200
     end
  end

  context "create " do
    should "create new item" do
      assert_difference("Item.count") do
      post :create 
      end
      assert_redirected_to item_path(assigns(:item))
    end
  end
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:items)
    end
  #
  #  test "should get new" do
  #    get :new
  #    assert_response :success
  #  end
  #
  #  test "should create item" do
  #    assert_difference('Item.count') do
  #      post :create, :item => { }
  #    end
  #
  #    assert_redirected_to item_path(assigns(:item))
  #  end
  #
  #  test "should show item" do
  #    get :show, :id => items(:one).to_param
  #    assert_response :success
  #  end
  #
  #  test "should get edit" do
  #    get :edit, :id => items(:one).to_param
  #    assert_response :success
  #  end
  #
  #  test "should update item" do
  #    put :update, :id => items(:one).to_param, :item => { }
  #    assert_redirected_to item_path(assigns(:item))
  #  end
  #
  #  test "should destroy item" do
  #    assert_difference('Item.count', -1) do
  #      delete :destroy, :id => items(:one).to_param
  #    end
  #
  #    assert_redirected_to items_path
  #  end


end
