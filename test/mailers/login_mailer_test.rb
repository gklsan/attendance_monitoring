require 'test_helper'

class LoginMailerTest < ActionMailer::TestCase
  test "login_msg" do
    mail = LoginMailer.login_msg
    assert_equal "Login msg", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
