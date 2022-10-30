
def create_user(values)
	default_values = {name: "test", email: "test@test.com", password: "pass", zipcode: 10028}
	values = default_values.merge(values)
	@test_user = User.new values
end


Given /the following users exist/ do |users_table|
    users_table.hashes.each do |user|
      # each returned element will be a hash whose key is the table header.
      # you should arrange to add that user to the database here.
      User.create(user)
    end
  end
  
Then /(.*) seed users should exist/ do | n_seeds |
    expect(User.count).to eq n_seeds.to_i
end

Given /^I have an account with email: "(.*)" and password: "(.*)"$/ do |email, password|
	@test_user =  create_user({email: email, password: password})
	@test_user.save!
end