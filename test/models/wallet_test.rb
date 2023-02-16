require "test_helper"

class WalletTest < ActiveSupport::TestCase

  # called before every single test
  setup do
    @user = User.create(first_name: "Sam", last_name: "Banana", profession: "Web developer", email: "info@sam.com", phone: "0199887682", address: "Sydney, Australia", password: "123123", user_type: "Lender")
  end

  # called after every single test
  teardown do
    @user = nil
    # when controller is using cache it may be a good idea to reset it afterwards
    Rails.cache.clear
  end

  test "Wallet is created when a new user is created" do
    assert @user.wallet, "Wallet was not created"
  end

  test "Wallet initial amount is zero" do
    assert_equal(0, @user.wallet.amount, "Wallet amount was not zero")
  end
end
