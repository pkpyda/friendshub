require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should enter content to create new status" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

  test "should enter user_id to create new status" do
  	status = Status.new
  	assert !status.save
  	assert !status.errors[:user_id].empty?
  end

  test "status conten should have minimum length 2" do
  	status = Status.new
  	status.content = ""
  	assert !status.save
  	assert !status.errors[:content].empty?
  end

end
