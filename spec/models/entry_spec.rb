require 'rails_helper'

RSpec.describe Entry, type: :model do
  subject {
    described_class.new(
      date: "2020-09-01",
      value: 100.00,
      memo: nil,
      account: Account.new,
      result_center: ResultCenter.new
    )
  }

  it "is valid when everything is filled, except memo" do
    expect(subject).to be_valid
  end

  it "is not valid when date is not filled" do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when value is not filled" do
    subject.value = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when account is not filled" do
    subject.account = nil
    expect(subject).to_not be_valid
  end

  it "is not valid when result center is not filled" do
    subject.result_center = nil
    expect(subject).to_not be_valid
  end

end
