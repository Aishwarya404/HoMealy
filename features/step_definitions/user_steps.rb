
def create_user(values)
	default_values = {name: "sample", email: "test@test.com", password: "pass", zipcode: 10028, address: "520 w 123", phone: 917917917}
	values = default_values.merge(values)
	@test_user = User.new values
end


# Given /^I have an account with email: "(.*)" and password: "(.*)"$/ do |email, password|
# 	@test_user =  create_user({email: email, password: password})
# 	@test_user.save!
# end

Given /^I have an account with email: "(.*)", name: "(.*)" and password: "(.*)"$/ do |email, name, password|
	@test_user =  create_user({email: email, password: password, name: name})
	@test_user.save!
end