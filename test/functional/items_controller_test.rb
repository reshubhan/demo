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

  should " update div with the partial" do
    get :update_div
    assert_response 200
    assert_template "items/_update_partial"
  end

	context "Place order response" do
		setup do
			@item = Factory.create(:item)
			@item1 = Factory.create(:item1)
		end

		should "return 200" do
      assert_difference("Order.count") do
      get :selected_item, {"item"=>["#{@item.name}_#{@item.price}", "#{@item1.name}_#{@item1.price}"]}
      end
      
      assert_difference("ItemOrder.count",2) do
      get :selected_item,  {"item"=>["#{@item.name}_#{@item.price}", "#{@item1.name}_#{@item1.price}"]}
      end
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
      assert_template(:index)
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

  context "creation and destroy of object" do
    setup do
			@item3 = Factory.create(:item)
		end

    should "get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:items)
    end
  
    should "get new" do
      get :new
      assert_response :success
    end
  
    should" create item" do
      assert_difference('Item.count') do
        post :create, :item => { }
      end
  
      assert_redirected_to item_path(assigns(:item))
    end
  
    should " show item" do
      get :show, :id => @item3.id
      assert_response :success
      assert_template :show
    end
  
    should " get edit" do
      get :edit, :id => @item3.id
      assert_response :success
    end
  
    should " update item" do
      put :update, :id => @item3.id, :item => { }
      assert_redirected_to item_path(assigns(:item))
    end
  
    should "destroy item" do
      assert_difference('Item.count', -1) do
        delete :destroy, :id => @item3.id
      end
  
      assert_redirected_to items_path
    end
  end

end
