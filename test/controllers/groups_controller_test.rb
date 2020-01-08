require "test_helper"

describe GroupsController do
  describe "index" do
    it "should get index" do
      #Act
      get "/groups"

      #Assert
      must_respond_with :success
    end
  end

  describe "show" do
    it "will show for valid ids" do
      # Arrange
      valid_group_id = groups(:mcgilvra).id
  
      # Act
      get "/groups/#{valid_group_id}"
  
      # Assert
      must_respond_with :success
    end
  
    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_group_id = -1
  
      # Act
      get "/groups/#{invalid_group_id}"
  
      # Assert
      must_respond_with :not_found
    end
  end

  describe "create" do
    it "creates a new group successfully with valid data" do
      group_hash = {
        group: {
          name: "fake",
          description: "a fake group",
          image: "https://i.vimeocdn.com/portrait/4907835_300x300",
          city: "seattle",
          state: "wa",
          country: "usa"
        }
      }

      expect {
        post groups_path, params: group_hash
      }.must_differ 'Group.count', 1

      new_group = Group.last
      must_redirect_to group_path(new_group.id)
    end
  end
end
