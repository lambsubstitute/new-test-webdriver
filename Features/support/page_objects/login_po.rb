# encoding: utf-8
# class documentation

class LoginPo
  include PageInitializer

  # Container identifier
  LOGIN_DIV_ID = 'login-panel'
  # Element identifiers
  USERNAME_INPUT_ID = 'username'
  PASSWORD_INPUT_ID = 'password'
  SUBMIT_INPUT_ID = 'login'


  def get_login_div
    @browser.div(:id, LOGIN_DIV_ID).wait_until_present
    @browser.div(:id, LOGIN_DIV_ID)
  end

  def enter_username(username)
    login_panel = get_login_div
    login_panel.text_field(:id, USERNAME_INPUT_ID).set(username)
  end

  def enter_password(password)
    login_panel = get_login_div
    login_panel.text_field(:id, PASSWORD_INPUT_ID).set(password)
  end

  def click_login
    login_panel = get_login_div
    login_panel.button(:id, SUBMIT_INPUT_ID).click
  end

end
