# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name



require 'open-uri'
require 'json'

companies = Array.new
number = 1
categories_array = []
while number < 10 
  json_file= JSON.parse(open("http://api.crunchbase.com/v/1/search.js?geo=78701&range=15&page=#{number}&api_key=u5e2vrkt7ybm25e7dsuqy58y").read)
  results = json_file["results"]
  results.each do |result|
    company_hash = {"Name" => result["name"], "Category Code" => result["category_code"], "Description" => result["description"], "Address" => result["address1"], "Address #2" => result["address2"], "Website" => result["homepage_url"]}
    companies << company_hash
    puts "Company: #{result["name"]}"

   Company.create name: result["name"], category: result["category_code"], description: result["description"], address1: result["address1"], address2: result["address2"], website: result["homepage_url"]

    # How many categories do we have?
    if !categories_array.include?(result["category_code"])
      categories_array << result["category_code"]
    end
  end
  number += 1
end
puts "Here are all the categories: #{categories_array}, there are #{categories_array.length} of them."

puts "I found #{companies.length} many companies in Austin, TX." 

