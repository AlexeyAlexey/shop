require "test_helper"

class SharedPurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shared_purchase = shared_purchases(:one)
  end

  test "should get index" do
    get shared_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_shared_purchase_url
    assert_response :success
  end

  test "should create shared_purchase" do
    assert_difference("SharedPurchase.count") do
      post shared_purchases_url, params: { shared_purchase: { product_id: @shared_purchase.product_id, shared_purchase_link: @shared_purchase.shared_purchase_link } }
    end

    assert_redirected_to shared_purchase_url(SharedPurchase.last)
  end

  test "should show shared_purchase" do
    get shared_purchase_url(@shared_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_shared_purchase_url(@shared_purchase)
    assert_response :success
  end

  test "should update shared_purchase" do
    patch shared_purchase_url(@shared_purchase), params: { shared_purchase: { product_id: @shared_purchase.product_id, shared_purchase_link: @shared_purchase.shared_purchase_link } }
    assert_redirected_to shared_purchase_url(@shared_purchase)
  end

  test "should destroy shared_purchase" do
    assert_difference("SharedPurchase.count", -1) do
      delete shared_purchase_url(@shared_purchase)
    end

    assert_redirected_to shared_purchases_url
  end
end
