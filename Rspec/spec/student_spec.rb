require 'json'
require_relative '../../classes/student'

describe Student do
  let(:age) { 18 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:classroom) { 'Science Class' }
  let(:student) { Student.new(age, classroom, name, parent_permission: parent_permission) }

  describe '#initialize' do
    it 'sets the age, name, parent_permission, and rentals' do
      expect(student.age).to eq(age)
      expect(student.name).to eq(name)
      expect(student.instance_variable_get(:@parent_permission)).to eq(parent_permission)
      expect(student.rentals).to be_an(Array)
      expect(student.rentals).to be_empty
    end
  end

  describe '#play_hooky' do
    it 'returns the correct string' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '.from_json' do
    let(:json_data) do
      {
        'type' => 'Student',
        'id' => 123,
        'age' => 18,
        'name' => 'Jane Smith',
        'parent_permission' => true
      }.to_json
    end

    it 'returns a Student object with correct attributes from JSON data' do
      parsed_data = JSON.parse(json_data)
      student = Student.from_json(json_data)

      expect(student).to be_a(Student)
      expect(student.id).to eq(parsed_data['id'].to_i)
      expect(student.age).to eq(parsed_data['age'])
      expect(student.name).to eq(parsed_data['name'])
      expect(student.instance_variable_get(:@parent_permission)).to eq(parsed_data['parent_permission'])
    end
  end
end
