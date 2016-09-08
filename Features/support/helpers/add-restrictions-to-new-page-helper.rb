def click_edit
  new_page = PagePo.new(@browser)
  new_page.click_edit
end

def click_restriction_button
  page = PagePo.new(@browser)
  page.click_restrictions
end

def restrictions_page_present?
  restrictions_popup = RestrictionsPopupPo.new(@browser)
  return restrictions_popup.restrictions_popup_present?
end

def edit_button_present?
  page = PagePo.new(@browser)
  return page.edit_button_present?
end

def get_restricted_page_text
  page = PagePo.new(@browser)
  return page.get_restricted_page_text
end


def get_restrictions_applied_label_text
  page = PagePo.new(@browser)
  return page.get_restrictions_applied_label_text
end


# Un-refactored UI elements to page object. Please see documentation accompanying this Exercise

def restrictions_option_popup_present?
  until @browser.section(:id, 'update-page-restrictions-dialog').exists? do
    sleep 1
  end
  # for some reason the div never appeared as visible, only existing, and only becamne existing when the functionality
  # was invoked. Given this the only ways to validate presence was to check the z access it the style attribute or the exist? flag
  # neither of which i like very much and would like to discuss a better solution with developers as html implementation may be causing issues.
  expect(@browser.div(:id, 'update-page-restrictions-dialog').attribute_value('style')).to include('z-index: 3000')
  # or
  expect(@browser.div(:id, 'update-page-restrictions-dialog').exist?).to eq(true)
end


def select_restriction_option_by_text_title(option)
  # same problems in finding the container as above, it was never seen as visible.
  open_restrictions_options
  item = get_restriction_option(option)
  item.click
  save_restricted_option
end

def save_restricted_option
  restrictions_popup = RestrictionsPopupPo.new(@browser)
  restrictions_popup.click_save
end

def open_restrictions_options
  restrictions_popup = RestrictionsPopupPo.new(@browser)
  restrictions_popup.open_options
end

def get_restriction_option(option)
  restrictions_popup = RestrictionsPopupPo.new(@browser)
  list = restrictions_popup.get_restriction_options
  return  restrictions_popup.get_span_of_option(list, option)
end
