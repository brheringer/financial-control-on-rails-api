require 'rails_helper'

RSpec.describe Account, type: :model do
  subject {
    described_class.new(structure: "1", 
                        name: "Account 1")
  }

  context "required attributes" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without structure" do
      subject.structure = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context "testing structure" do

    it "is not valid when structure has letters" do
      subject.structure = "asdf"
      expect(subject).to_not be_valid
    end
    
    it "is not valid when structure is empty" do
      subject.structure = ""
      expect(subject).to_not be_valid
    end

    it "is valid when structure is valid (2 levels)" do
      subject.structure = "1.01"
      expect(subject).to be_valid
    end

    it "is valid when structure is valid (3 levels)" do
      subject.structure = "1.01.01"
      expect(subject).to be_valid
    end

  end
end
