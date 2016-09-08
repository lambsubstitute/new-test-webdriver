# encoding: utf-8
# class documentation

class PagePo
  include PageInitializer

  # Container identifier
  PAGE_DIV_ID = 'main'
  HEADER_DIV_ID = 'title-text'
  # Element identifiers
  EDIT_LINK_ID = 'editPageLink'
  RESTRICTIONS_LINK_ID = 'content-metadata-page-restrictions'
  INNERTIPSY_DIV_CLASS = 'tipsy-inner'
  RESTRICTED_DIV_ID = 'page-restricted-container'

  def get_page
    @browser.div(:id, PAGE_DIV_ID).wait_until_present
    @browser.div(:id, PAGE_DIV_ID)
  end

  def get_page_name
    page = get_page
    page.h1(:id, HEADER_DIV_ID).wait_until_present
    page.h1(:id, HEADER_DIV_ID).text
  end

  def click_edit
    page = get_page
    page.link(:id, EDIT_LINK_ID).wait_until_present
    page.link(:id, EDIT_LINK_ID).click
  end

  def edit_button_present?
    page = get_page
    return page.link(:id, EDIT_LINK_ID).present?
  end

  def click_restrictions
    page = get_page
    page.link(:id, RESTRICTIONS_LINK_ID).wait_until_present
    page.link(:id, RESTRICTIONS_LINK_ID).click
  end
  
  def is_page_restricted?
    page = get_page
    return page.div(:id, RESTRICTED_DIV_ID).present?
  end

  def get_restricted_page_text
    page = get_page
    return page.div(:id, RESTRICTED_DIV_ID).text
  end

  def get_restrictions_applied_label_text
    # look up was being difficult so waiting till seen in browser before narrowing focus
    @browser.div(:class, INNERTIPSY_DIV_CLASS).wait_until_present
    return @browser.div(:class, INNERTIPSY_DIV_CLASS).text
  end
end