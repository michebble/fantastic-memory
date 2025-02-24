# frozen_string_literal: true

require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def test_authenticated_user_get_show
    user = users(:one)
    sign_in_as(user)
    get(root_url)
    assert_response(:success)
    sign_out
  end

  def test_unauthenticated_user_redirect_to_session_new
    get(root_url)
    assert_redirected_to(new_session_url)
  end
end
