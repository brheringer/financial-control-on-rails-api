require 'rails_helper'

RSpec.describe ResultCenter, type: :model do
  subject {
    described_class.new(name: "Center 1")
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
