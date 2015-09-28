require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(chefname: "Emeril", email:"testchef@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chefname should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chefname should be more than 3 chars" do
    @chef.chefname = "i" * 2
    assert_not @chef.valid?
  end
  
  test "chefname should be less than 40 chars" do
    @chef.chefname = "i" * 41
    assert_not @chef.valid?
  end
  
  test "email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "email should be less than 100 chars" do
    @chef.email = "i" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email should be unique" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end
  
  test "email should match a valid email pattern successfully" do
    valid_addresses = %w[user@example.com R_TDD-EMAIL@example.something.org something@fieal.net first.late@name.co]
    
    valid_addresses.each do |address|
      @chef.email = address
      assert @chef.valid?, '#{address.inspect} should return valid'
    end
  end
  
  test "should reject invalid email formats" do
    invalid_addresses = %w[user@example,com R_TDD-EMAIL_at_example.something.org something@fiealdotnet]
    
    invalid_addresses.each do |address|
      @chef.email = address
      assert_not @chef.valid?, '#{address.inspect} should not return valid'
    end
  end
  
end