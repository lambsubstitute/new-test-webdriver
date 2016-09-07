# encoding: utf-8
# class documentation

class PagePo
  include PageInitializer

  # Container identifier
  PAGE_DIV_ID = 'main'
  HEADER_DIV_ID = 'title-text'
  # Element identifiers
  EDIT_BUTTON_ID = 'rte-button-edit'

  def get_page
    @browser.div(:id, PAGE_DIV_ID).wait_until_present
    @browser.div(:id, PAGE_DIV_ID)
  end

  def get_page_name
    new_page_form = get_page
    new_page_form.h1(:id, HEADER_DIV_ID).wait_until_present
    new_page_form.h1(:id, HEADER_DIV_ID).text
  end
end