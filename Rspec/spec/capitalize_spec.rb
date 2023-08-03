require_relative '../../decorators/base_decorator'
require_relative '../../decorators/capitalize_decorator'
require 'rspec'
describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }
  describe '#correct_name' do
    it 'capitalizes the name from the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('john doe')
      result = decorator.correct_name
      expect(result).to eq('John doe')
    end
  end
end
