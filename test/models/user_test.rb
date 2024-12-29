# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(email_address: "one@example.com", password: "password", password_confirmation: "password")
    assert user.valid?
  end

  test "invalid without password" do
    user = User.new(email_address: "one@example.com")
    assert_not user.valid?, "user is valid without a password"
    assert_not_nil user.errors[:password], "no validation error for password present"
  end

  test "invalid without email address" do
    user = User.new(password: "password", password_confirmation: "password")
    assert_not user.valid?, "user is valid without an email address"
    assert_not_nil user.errors[:email_address], "no validation error for email address present"
  end
end
