require_relative '../../decorators/nameable'
require 'rspec'
describe Nameable do
  let(:nameable) { Nameable.new }
  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
