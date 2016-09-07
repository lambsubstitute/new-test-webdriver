# encoding: utf-8
# class documentation

class CreateNewPagePo
  include PageInitializer

  # Container identifier
  CREATE_PAGE_FORM_ID = 'createpageform'
  PAGE_NAME_INPUT_ID = 'content-title'
  # Element identifiers
  SAVE_BUTTON_ID = 'rte-button-publish'
  PREVIEW_BUTTON_ID = 'rte-button-preview'
  CLOSE_BUTTON_ID = ''

  def get_new_page_form
    @browser.form(:id, CREATE_PAGE_FORM_ID).wait_until_present
    @browser.form(:id, CREATE_PAGE_FORM_ID)
  end

  def enter_page_name(pageName)
    new_page_form = get_new_page_form
    new_page_form.text_field(:id, PAGE_NAME_INPUT_ID).set(pageName)
  end

  def page_name_input_present
    new_page_form = get_new_page_form
    return new_page_form.text_field(:id, PAGE_NAME_INPUT_ID).present?
  end

  def click_save
    new_page_form = get_new_page_form
    new_page_form.button(:id, SAVE_BUTTON_ID).click
  end

  def click_preview
    new_page_form = get_new_page_form
    new_page_form.button(:id, PREVIEW_BUTTON_ID).click
  end

end






