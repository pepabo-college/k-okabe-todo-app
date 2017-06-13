require 'rails_helper'

describe Task do
  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end
  it { is_expected.to validate_presence_of(:content) }
end
