require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  should belong_to(:user)
  should belong_to(:friend)

  test 'creating friendship that  works without raising exception' do
  	assert_nothing_raised do
  		UserFriendship.create(user: users(:praveen), friend: users(:akhil))
  	end
  end 

  test 'creating friendship that works with IDs' do
  	assert_nothing_raised do
  		UserFriendship.create(user_id: users(:praveen).id, friend_id: users(:akhil).id )
  		users(:praveen).friends.include?(users(:akhil))
  	end
  end
end
