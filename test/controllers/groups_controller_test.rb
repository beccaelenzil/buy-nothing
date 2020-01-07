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
    it "will get show for valid ids" do
      # Arrange
      valid_group_id = 1
  
      # Act
      get "/groups/#{valid_group_id}"
  
      # Assert
      must_respond_with :success
    end
  
    it "will respond with not_found for invalid ids" do
      # Arrange
      invalid_group_id = 999
  
      # Act
      get "/groups/#{invalid_group_id}"
  
      # Assert
      must_respond_with :not_found
    end
  end
end
