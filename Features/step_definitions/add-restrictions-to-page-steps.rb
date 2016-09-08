Given(/^I have created a new page and am on the edit page for it$/) do
  click_quick_create
  create_page(generate_random_page_title)
  expect(get_page_title).to eq(@generate_page_name)
  click_edit
end

When(/^I open the restriction options$/) do
  click_restriction_button
end

Then(/^I should be presented with the options to edit restrictions$/) do
  until @browser.section(:id, 'update-page-restrictions-dialog').exists? do
    sleep 1
  end
  expect(@browser.div(:id, 'update-page-restrictions-dialog').attribute_value('style')).to include('z-index: 3000')
  # or
  expect(@browser.div(:id, 'update-page-restrictions-dialog').exist?).to eq(true)
end

And(/^set the restrictions to "([^"]*)"$/) do |arg|
  @browser.link(:class, 'select2-choice').wait_until_present
  @browser.link(:class, 'select2-choice').click
  list = @browser.div(:id, 'select2-drop')
  list.lis.each do |li|
    if li.attribute_value('class') === 'select2-results-dept-0 select2-result select2-result-selectable'
      if li.span(:class, 'title').text === arg
        @item_to_click = li.span(:class, 'title')
      end
    end
  end
  @item_to_click.click
  sleep 1
  @browser.button(:id, 'page-restrictions-dialog-save-button').click
  #wait for the save to happen, if not it can error
  sleep 2
end

Then(/^page should show restrictions were applied$/) do
  @browser.div(:class, 'tipsy-inner').wait_until_present
  text = @browser.div(:class, 'tipsy-inner').text
  expect(text).to eq('Restrictions apply')
end

When(/^I login with the username "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  login(arg1, arg2)
end

And(/^navigate to the restricted page$/) do
  @browser.goto(@new_page_url)
end

Then(/^I should not be able to edit it$/) do
  page = PagePo.new(@browser)
  expect(page.edit_button_present?).to eq(false)
end

Then(/^I should be able to edit it$/) do
  page = PagePo.new(@browser)
  expect(page.edit_button_present?).to eq(true)
end

Then(/^I should be redirected to the request access page$/) do
  @browser.div(:id, 'page-restricted-container').wait_until_present
  text = @browser.div(:id, 'page-restricted-container').text
  expect(text).to include('You do not have permission to view this page. Request access below')
end