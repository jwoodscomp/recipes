require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "Emeril", email:"testchef@example.com")
    @recipe = @chef.recipes.build(name: "Spicy Test Recipe", summary: "This is the spiciest test recipe", description: "The recipe exists as a spicy test of the model validations")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "recipe should belong to the chef" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name should be greater than 5 chars" do
    @recipe.name = "i" * 4
    assert_not @recipe.valid?
  end
  
  test "name should be less than 100 chars" do
    @recipe.name = "i" * 101
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = ""
    assert_not @recipe.valid?
  end
  
  test "summary should be greater than 10 chars" do
    @recipe.summary = "i" * 9
    assert_not @recipe.valid?
  end
  
  test "summary should be less than 150 chars" do
    @recipe.summary = "i" * 151
    assert_not @recipe.valid?
  end
  
  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end
  
  test "description should be greater than 20 chars" do
    @recipe.description = "i" * 19
    assert_not @recipe.valid?
  end
  
  test "description should be less than 500 chars" do
    @recipe.description = "i" * 501
    assert_not @recipe.valid?
  end
end