require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_requires_email
    user = User.new(email_address: nil, password: "password", name: "Foo")
    assert_not user.valid?
  end

  def test_requires_name
    user = User.new(email_address: "foo@example.com", password: "password", name: nil)
    assert_not user.valid?
  end

  def test_email_is_normalized
    user = User.new(email_address: " FoO@eXAMple.com  ", password: "password", name: "Foo")
    assert user.valid?
    assert_equal "foo@example.com", user.email_address
  end

  def test_email_is_encrypted
    user = User.create!(email_address: "foo@example.com", password: "password", name: "Foo")
    assert_equal "foo@example.com", user.email_address
    assert_not_equal "foo@example.com", User.find(user.id).email_address
  end
end
