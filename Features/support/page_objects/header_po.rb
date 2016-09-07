# encoding: utf-8
# class documentation

class HeaderPo
  include PageInitializer

  # Container identifier
  HEADER_DIV_ID = 'header'
  # identifier lookup
  QUICK_CREATE_LINK_ID = 'quick-create-page-button'


  def get_header_div
    @browser.header(:id, HEADER_DIV_ID).wait_until_present
    @browser.header(:id, HEADER_DIV_ID)
  end

  def click_quick_create
    header_div = get_header_div
    header_div.link(:id, QUICK_CREATE_LINK_ID).click
  end
end