require 'rails_helper'

RSpec.describe Animal, type: :model do
  it "is valid when the attributes are present" do
    animal = Animal.create(common_name:"Dog", latin_name:"El Dog", kingdom:"Doggotown")
    expect(animal).to be_valid
  end

  it "raises errors when the attributes are empty" do
    animal = Animal.create(common_name:"", latin_name:"", kingdom:"")
    expect(animal.errors).to_not be_empty
  end

  it "cannot have a duplicate of an existing row" do
    animal1 = Animal.create(common_name:"Dog", latin_name:"El Dog", kingdom:"Doggotown")
    animal2 = Animal.create(common_name:"Dog", latin_name:"El Dog", kingdom:"Doggotown")
    expect(animal2.errors).to_not be_empty
  end

  it "must have a unique common name and latin name" do
    animal = Animal.create(common_name:"Dog", latin_name:"Dog", kingdom:"Doggotown")
    expect(animal.errors).to_not be_empty
  end

end
