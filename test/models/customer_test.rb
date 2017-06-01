require 'test_helper'

describe Customer do
  let(:aaron) {customers(:aaron)}
  let(:david) {customers(:david)}
  let(:carter) {customers(:carter)}

  describe 'validations' do
    it "is a valid customer" do
      expect(aaron).must_be :valid?
    end

    it "is an invalid customer because of duplicate usernames" do
      expect(david).must_be :invalid?
      expect(david.errors[:username]).must_include "has already been taken"
    end

    it "is an invalid customer because of no last_name" do
      expect(carter).must_be :invalid?
      expect(carter.errors[:last_name]).must_include "can't be blank"
    end
  end
end
