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