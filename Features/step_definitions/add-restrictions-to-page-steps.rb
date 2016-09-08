# Given steps
Given(/^I have created a new page and am on the edit page for it$/) do
  click_quick_create
  create_page(generate_random_page_title)
  expect(get_page_title).to eq(@generate_page_name)
  click_edit
end

# When steps
When(/^I login with the username "([^"]*)" and password "([^"]*)"$/) do |arg1, arg2|
  login(arg1, arg2)
end

And(/^navigate to the restricted page$/) do
  go_to_page(@new_page_url)
end

When(/^I open the restriction options$/) do
  click_restriction_button
end

And(/^set the restrictions to "([^"]*)"$/) do |arg|
  select_restriction_option_by_text_title(arg)
end

# Then steps
Then(/^page should show restrictions were applied$/) do
  expect(get_restrictions_applied_label_text).to eq('Restrictions apply')
end

Then(/^I should not be able to edit it$/) do
  expect(edit_button_present?).to eq(false)
end

Then(/^I should be able to edit it$/) do
  expect(edit_button_present?).to eq(true)
end

Then(/^I should be redirected to the request access page$/) do
  expect(get_restricted_page_text).to include('You do not have permission to view this page. Request access below')
end

Then(/^I should be presented with the options to edit restrictions$/) do
  restrictions_option_popup_present?
end

When(/^I login as a non admin user$/) do
  login(DEFAULT_NON_ADMIN_USERNAME, DEFAULT_PASSWORD)
end