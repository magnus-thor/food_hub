Given("I visit site") do
  visit root_path
end

Given("We have the following list:") do |table|
  table.hashes.each do |recipe|
    FactoryBot.create(:recipe, recipe)
  end
end

When('I click {string}') do |link|
  click_link_or_button link
end

When('I fill in {string} with {string}') do |field, text|
  fill_in field, with: text
end

Given("We have the following user:") do |table|
  table.hashes.each do |user|
      @user = FactoryBot.create(:user, user)
  end
end

Given("I am logged in") do
  login_as @user
end

Given("I open the browser") do
  save_and_open_page
end

Given("I visit login page") do
  visit new_user_session_path
end
