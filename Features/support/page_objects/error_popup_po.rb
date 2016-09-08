#encoding: utf-8
# class documentation

class ErrorPopupPo
  include PageInitializer

  # Container identifier
  ERROR_POPUP_CLASS = 'aui-flag-container'


  def get_error_popup_container
    @browser.div(:id, ERROR_POPUP_CLASS).wait_until_present
    @browser.div(:id, ERROR_POPUP_CLASS)
  end

  def get_error_popup_message
    error_popup = get_error_popup_container
    return error_popup.text
  end
end
