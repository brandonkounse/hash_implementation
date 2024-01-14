# frozen_string_literal: true

require_relative '../lib/my_hash'
require_relative 'spec_helper'

# tests for custom hash data structure class
describe MyHash do
  subject(:hash) { described_class.new }

  describe '#hash' do
    context 'when given a valid string argument' do
      it 'hashes "hello" to 9834468' do
        string = 'hello'
        code = 9_834_468
        expect(hash.hash(string)).to eq(code)
      end

      it 'hashes "Gandalf the Grey" to 364531151263929443557' do
        string = 'Gandalf the Grey'
        code = 364_531_151_263_929_443_557
        expect(hash.hash(string)).to eq(code)
      end
    end

    context 'when given a non-string type' do
      it 'rescues NoMethodError for argument 457' do
        expect { hash.hash(457) }.to output("please enter a string argument\n").to_stdout
      end

      it 'rescues NoMethodError for argument :this_should_fail' do
        expect { hash.hash(:this_should_fail) }.to output("please enter a string argument\n").to_stdout
      end
    end
  end

  describe '#set' do
    context 'when adding key/value pairs to array' do
      it 'creates k/v pair for "test, :test" at position 0' do
        key = 'test'
        value = :test
        expect { hash.set(key, value) }.to change { hash.buckets[0] }.from(nil).to(LinkedList)
      end

      it 'expects value to eq :test for key "test"' do
        key = 'test'
        value = :test
        hash.set(key, value)
        expect(hash.buckets[0].at(0).value).to eq(:test)
      end
    end
  end
end
