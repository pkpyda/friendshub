require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'a user should enter first_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end

  test 'a user should enter last_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end

  test 'a user should enter profile_name' do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'a user should have unique profile_name' do
  	user = User.new
  	user.profile_name = users(:praveen).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'a user should enter correctly formatted profile_name' do
  	user = User.new
  	user.profile_name = "profile_name with spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?('Profile name must be formatted correctly')
  end
end
