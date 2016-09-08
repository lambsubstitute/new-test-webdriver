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
    sleep 5
    puts @browser.div(:id, 'update-page-restrictions-dialog').attribute_value('style')
    #puts @browser.text
    #puts @browser.div(:id, 'update-page-restrictions-dialog').exist?
    #puts @browser.div(:id, 'update-page-restrictions-dialog').present?
    div = @browser.div(:id, 'update-page-restrictions-dialog')
    puts div.section(:id, 'update-page-restrictions-dialog').visible?
end