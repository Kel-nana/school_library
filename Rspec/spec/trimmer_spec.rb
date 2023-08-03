require_relative '../../decorators/base_decorator'
require_relative '../../decorators/trimmer_decorator'

require 'rspec'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    context 'when the name is longer than 10 characters' do
      it 'trims the name to 10 characters' do
        long_name = 'John Doe Long Name'
        trimmed_name = 'John Doe L'
        allow(nameable).to receive(:correct_name).and_return(long_name)

        result = decorator.correct_name

        expect(result).to eq(trimmed_name)
      end
    end
  end
end