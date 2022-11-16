
def create_user(values)
	default_values = {name: "sample", email: "test@test.com", password: "pass", zipcode: 10028, address: "520 w 123", phone: 9179179171, favorite_cuisine: "Thai"}
	values = default_values.merge(values)
	@test_user = User.new values
end

Given /^I have an account with email: "(.*)", name: "(.*)", zipcode: "(.*)" and password: "(.*)"$/ do |email, name, zipcode, password|
	@test_user =  create_user({email: email, password: password, name: name, zipcode: zipcode})
	@test_user.save!
end