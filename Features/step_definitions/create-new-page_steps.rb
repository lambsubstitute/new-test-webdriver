# given steps
Given(/^I am logged in to confluence$/) do
  # enters username and password and clicks login
  login(DEFAULT_USERNAME, DEFAULT_PASSWORD)
end


# when steps
When(/^I am on the create new page$/) do
  # finds and clicks the quick create button
  click_quick_create
end

When(/^I create the blank page with the name "([^"]*)"$/) do |pageName|
  # enter new page name and click save
  create_page(pageName)
end

When(/^I preview the new page$/) do
  # click the preview button
  click_preview_page
end

When(/^I create a blank page$/) do
  # enter generated page name and click save
  create_page(generate_random_page_title)
end

And(/^I give the page a title$/) do
  # enter a page title with a generated page name
  add_page_name(generate_random_page_title)
end

When(/^I create a new page with the same name as one that exists$/) do
  # create a page with generated title, confirm creation, then click
  # create page and attempt to create a second with same name
  create_page(generate_random_page_title)
  expect(get_page_title).to eq(@generate_page_name)
  click_quick_create
  create_page(@generate_page_name)
end


# then steps
Then(/^the new page "([^"]*)" should be created$/) do |pageName|
  # page title should equal the expected
  expect(get_page_name).to eq(pageName)
end

Then(/^I should see the standard create new page inputs$/) do
  # page name input should be present
  expect(create_page_title_input_present?).to eq(true)
end

Then(/^The new page preview should be displayed$/) do
  # preview page is present, this requires changing to iframe container
  @browser.frame(:id, PREVIEW_IFRAME_ID).use do
    expect(preview_page_present?).to eq(true)
  end
end

Then(/^I should be redirected to the new page$/) do
  # page name should match generated page name
  expect(get_page_title).to eq(@generate_page_name)
end


Then(/^I should receive the validation error "([^"]*)"$/) do |arg|shoul
  # validation error should match text string
  expect(get_error_message).to eq(arg)
end

Then(/^I should receive the validation error$/) do |text|
  # validation error should match text block with substitutions if required
  if text.include? 'page_title_placeholder'
    # if the message has the page_title_holder, substitute this with the generated page name
    text = text.gsub('page_title_placeholder', @generate_page_name)
  end
  expect(get_error_message).to eq(text)
end


Given(/^I create "([^"]*)" new pages$/) do |arg|
  count = 0
  i = arg.to_i
  generate_random_page_title
  while count < i
    create_page(@generate_page_name + '_' + count.to_s)
    expect(get_page_title).to eq(@generate_page_name + '_' + count.to_s)
    @browser.goto(BASE_URL)
    click_quick_create
    count = count + 1
  end
end

Given(/^I create "([^"]*)" child pages of a new page$/) do |arg|
  p count = 0
  i = arg.to_i
  create_page(generate_random_page_title)
  expect(get_page_title).to eq(@generate_page_name)
  parent_page_url = @browser.url
  while count < i
    @browser.goto(parent_page_url)
    click_quick_create
    create_page('child_' + count.to_s + '_' + @generate_page_name)
    expect(get_page_title).to eq('child_' + count.to_s + '_' + @generate_page_name)
    count = count + 1
  end
end