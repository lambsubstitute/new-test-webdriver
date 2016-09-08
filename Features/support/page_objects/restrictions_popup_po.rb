#encoding: utf-8
# class documentation

class RestrictionsPopupPo
  include PageInitializer

  # Container identifier
  RESTRICTIONS_DIV_CLASS = 'aui-dialog2-content'


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


end