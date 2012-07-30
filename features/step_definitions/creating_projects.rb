#Given /^I am on the homepage$/ do
Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

#When /^I follow "(.*?)"$/ do |follow|
When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

#When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

#When /^I press "(.*?)"$/ do |arg1|
When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

#Then /^I should see "(.*?)"$/ do |arg1|
Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

#Then /^I should be on the project page for "(.*?)"$/ do |arg1|
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
