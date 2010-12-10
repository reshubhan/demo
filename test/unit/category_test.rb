require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + "/../factories"

class CategoryTest < ActiveSupport::TestCase
  context "an existing category" do
    setup do
      @category = Factory(:category)
    end

    should validate_uniqueness_of :name
  end
end
