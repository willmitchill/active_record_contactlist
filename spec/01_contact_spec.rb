require 'rspec'
require_relative '../spec_helper'

describe Contact do

  describe "initialization" do
    describe "should initilaize a new instance of a contact" do
      subject(:contact) {
        Contact.new("Aunt", "Jemima", "auntj@gmail.com", "778-350-1111")
      }

      its(:first_name) { should eq("Aunt")}
      its(:last_name) { should eq("Jemima")}
      its(:email) { should eq("auntj@gmail.com")}
      its(:phone_number) { should eq("778-350-1111")}
    end
  end


  # use . for class methods
  describe ".create" do
    it "shoult create a new instance of a contact" do
      contact = Contact.create(first_name, last_name, email, phone_number)
      contact.should be_an_instance_of(Contact)
    end
  end


  # use . for class methods
  describe ".find" do

  end

  # use . for class methods
  describe ".all" do

  end

end
