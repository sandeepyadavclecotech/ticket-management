require "test_helper"

class CutomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cutomer = cutomers(:one)
  end

  test "should get index" do
    get cutomers_url
    assert_response :success
  end

  test "should get new" do
    get new_cutomer_url
    assert_response :success
  end

  test "should create cutomer" do
    assert_difference("Cutomer.count") do
      post cutomers_url, params: { cutomer: {  } }
    end

    assert_redirected_to cutomer_url(Cutomer.last)
  end

  test "should show cutomer" do
    get cutomer_url(@cutomer)
    assert_response :success
  end

  test "should get edit" do
    get edit_cutomer_url(@cutomer)
    assert_response :success
  end

  test "should update cutomer" do
    patch cutomer_url(@cutomer), params: { cutomer: {  } }
    assert_redirected_to cutomer_url(@cutomer)
  end

  test "should destroy cutomer" do
    assert_difference("Cutomer.count", -1) do
      delete cutomer_url(@cutomer)
    end

    assert_redirected_to cutomers_url
  end
end
