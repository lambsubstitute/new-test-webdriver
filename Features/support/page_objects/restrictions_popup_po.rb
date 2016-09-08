#encoding: utf-8
# class documentation

class RestrictionsPopupPo
  include PageInitializer

  # Container identifier
  RESTRICTIONS_DIV_CLASS = 'aui-dialog2-content'
  OPTIONS_LINK_CLASS = 'select2-choice'
  OPTIONS_DIV_ID = 'select2-drop'
  RESTRICTION_OPTION_CLASS = 'select2-results-dept-0 select2-result select2-result-selectable'
  TITLE_SPAN_CLASS = 'title'
  SAVE_BUTTON_ID = 'page-restrictions-dialog-save-button'


  def get_restrictions_popup_container
    @browser.div(:class, RESTRICTIONS_DIV_CLASS).wait_until_present
    @browser.div(:class, RESTRICTIONS_DIV_CLASS)
  end

  def restrictions_popup_present?
    @browser.div(:class, RESTRICTIONS_DIV_CLASS).wait_until_present
    return @browser.div(:class, RESTRICTIONS_DIV_CLASS).present?
  end

  def get_restrictions_popup_message
    error_popup = get_error_popup_container
    return error_popup.text
  end

  def open_options
    @browser.link(:class, OPTIONS_LINK_CLASS).wait_until_present
    @browser.link(:class, OPTIONS_LINK_CLASS).click
  end

  def click_save
    sleep 1
    @browser.button(:id, SAVE_BUTTON_ID).click
    sleep 2
  end

  def get_restriction_options
   return @browser.div(:id, OPTIONS_DIV_ID)
  end

  def get_span_of_option(list, option)
    list.lis.each do |li|
      if li.attribute_value('class') === RESTRICTION_OPTION_CLASS
        if li.span(:class, TITLE_SPAN_CLASS).text === option
          return li.span(:class, TITLE_SPAN_CLASS)
        end
      end
    end
  end
end