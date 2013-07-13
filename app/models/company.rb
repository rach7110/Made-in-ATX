class Company < ActiveRecord::Base
  attr_accessible :address1, :address2, :category, :description, :name, :website
end
