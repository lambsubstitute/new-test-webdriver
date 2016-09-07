# encoding: utf-8
# class documentation

class PreviewNewPagePo
  include PageInitializer


  # Container identifier
  PREVIEW_DIV_ID = 'preview'
  PREVIEW_IFRAME_ID = 'editor-preview-iframe'
  PAGE_TITLE_HEADER_ID = 'title-text'
  # Element identifiers
  SAVE_BUTTON_ID = 'rte-button-publish'
  PREVIEW_BUTTON_ID = 'rte-button-preview'
  CLOSE_BUTTON_ID = ''


    def get_preview_frame
      @browser.div(:id, PREVIEW_DIV_ID).wait_until_present
      return @browser.frame(:id, PREVIEW_IFRAME_ID)
    end

    def get_page_name
      @browser.h1(:id, PAGE_TITLE_HEADER_ID).wait_until_present
      return @browser.h1(:id, PAGE_TITLE_HEADER_ID).text
    end

end