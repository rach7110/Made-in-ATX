require 'crunchbase' 

Crunchbase::API.key = "u5e2vrkt7ybm25e7dsuqy58y"



# puts "Hello World!"

# search = Crunchbase::Search.find("78701")

# search.js?geo=<city, state, zip, country-code, etc.>&range=<some radius in miles>

require 'open-uri'
require 'json'

# companies = Array.new

# This made the hash of companies
companies = Array.new
number = 1
categories_array = []
while number < 10 
  json_file= JSON.parse(open("http://api.crunchbase.com/v/1/search.js?geo=78701&range=15&page=#{number}&api_key=u5e2vrkt7ybm25e7dsuqy58y").read)
  results = json_file["results"]
  results.each do |result|
    company_hash = {"Name" => result["name"], "Category Code" => result["category_code"], "Description" => result["description"], "Address" => result["address1"], "Address #2" => result["address2"], "Website" => result["homepage_url"]}
    companies << company_hash


    # How many categories do we have?
    if !categories_array.include?(result["category_code"])
      categories_array << result["category_code"]
    end
  end
  number += 1
end
puts "Here are all the categories: #{categories_array}, there are #{categories_array.length} of them."

puts "I found #{companies.length} many companies in Austin, TX." 

# puts "Here are the categories, and the descriptions"


# puts companies

# companies.each do |company|
#   puts "Category: #{company['Category Code']} + Description: #{company['Description']}"
# end


#Create new companies
# Company.new(company[name], company[description], company[address], company[website])



# result_array.each do |company|
#   companies << company[0]
# end
# puts companies