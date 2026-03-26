require "test_helper"

class SharedPurchaseLinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shared_purchase_link = shared_purchase_links(:one)
  end

  test "should get index" do
    get shared_purchase_links_url
    assert_response :success
  end

  test "should get new" do
    get new_shared_purchase_link_url
    assert_response :success
  end

  test "should create shared_purchase_link" do
    assert_difference("SharedPurchaseLink.count") do
      post shared_purchase_links_url, params: { shared_purchase_link: {} }
    end

    assert_redirected_to shared_purchase_link_url(SharedPurchaseLink.last)
  end

  test "should show shared_purchase_link" do
    get shared_purchase_link_url(@shared_purchase_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_shared_purchase_link_url(@shared_purchase_link)
    assert_response :success
  end

  test "should update shared_purchase_link" do
    patch shared_purchase_link_url(@shared_purchase_link), params: { shared_purchase_link: {} }
    assert_redirected_to shared_purchase_link_url(@shared_purchase_link)
  end

  test "should destroy shared_purchase_link" do
    assert_difference("SharedPurchaseLink.count", -1) do
      delete shared_purchase_link_url(@shared_purchase_link)
    end

    assert_redirected_to shared_purchase_links_url
  end
end
