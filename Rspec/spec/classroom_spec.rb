require 'rspec'
require_relative '../../classes/classroom'
describe Classroom do
  let(:label) { 'A101' }
  let(:classroom) { Classroom.new(label) }
  describe '#initialize' do
    it 'sets the label and initializes an empty array of students' do
      expect(classroom.label).to eq(label)
      expect(classroom.instance_variable_get(:@students)).to be_an(Array)
      expect(classroom.instance_variable_get(:@students)).to be_empty
    end
  end
  describe '#add_student' do
    let(:student) { double('student') }
    context 'when the student is not already in the classroom' do
      it 'adds the student to the classroom and sets the classroom for the student' do
        expect(classroom.instance_variable_get(:@students)).to be_empty
        expect(student).to receive(:classroom=).with(classroom)
        classroom.add_student(student)
        expect(classroom.instance_variable_get(:@students)).to include(student)
      end
    end
  end
end
