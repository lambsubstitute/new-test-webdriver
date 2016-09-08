def add_page_name(page_name)
  # enter page name in to new page name text field
  create_page = CreateNewPagePo.new(@browser)
  create_page.enter_page_name(page_name)
end

def save_new_page
  # click save new page button
  create_page = CreateNewPagePo.new(@browser)
  create_page.click_save
  sleep 1
  # save the url for later date when needing to navigate back to this new page
  @new_page_url = @browser.url
end

def create_page(page_name)
  # add new page and click save.
  add_page_name(page_name)
  save_new_page
end


def click_preview_page
  # click preview
  create_page = CreateNewPagePo.new(@browser)
  create_page.click_preview
end

def create_page_title_input_present?
  # page name input present?
  create_page = CreateNewPagePo.new(@browser)
  return create_page.page_name_input_present
end

def generate_random_page_title
  # @generate_page_name stores the page name created so it can be reused in further steps
  @generate_page_name = ('a'..'z').to_a.shuffle[0, 8].join
  return @generate_page_name
end


def click_quick_create
  # click quick create
  header = HeaderPo.new(@browser)
  header.click_quick_create
end

def login(username, password)
  # enter login details and click login
  # first make sure the cookies have been cleared to clear any current login session
  @browser.cookies.clear
  @browser.goto(BASE_URL)
  login = LoginPo.new(@browser)
  login.enter_username(username)
  login.enter_password(password)
  login.click_login
end

def preview_page_present?
  # preview page present with generated page name
  title = get_preview_title
  return title === @generate_page_name
end

def get_preview_title
  # return page name
  preview = PreviewNewPagePo.new(@browser)
  return preview.get_page_name
end

def get_page_title
  # get page title
  new_page = PagePo.new(@browser)
  return new_page.get_page_name
end

def get_error_message
  # get error message and return
  error_popup = ErrorPopupPo.new(@browser)
  error_message = error_popup.get_error_popup_message
  puts('got the following error message: ' + error_message)
  return error_message
end