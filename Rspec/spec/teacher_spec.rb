require 'json'
require 'rspec'
require_relative '../../classes/teacher'

describe Teacher do
  let(:age) { 25 }
  let(:specialization) { 'Programming' }
  let(:name) { 'kelvin' }
  let(:teacher) { Teacher.new(age, specialization, name) }
  describe '#initialize' do
    it 'should set instance variables as expected' do
      expect(teacher).to be_kind_of(Person)
      expect(teacher.age).to eq(age)
      expect(teacher.instance_variable_get(:@specialization)).to eq(specialization)
      expect(teacher.name).to eq(name)
    end
  end
  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end

  describe '#to_json' do
    it 'returns the teacher details as a JSON string' do
      expected_json = {
        'type' => 'Teacher',
        'id' => 17,
        'age' => age,
        'name' => name,
        'specialization' => specialization
      }.to_json
      teacher.id = 17
      expect(teacher.to_json).to eq(expected_json)
    end
  end

  describe '.from_json' do
    let(:json_data) do
      {
        'type' => 'Teacher',
        'age' => 25,
        'name' => 'Jane Smith',
        'parent_permission' => true,
        'specialization' => 'math'
      }.to_json
    end

    it 'returns a Teacher object with correct attributes from JSON data' do
      parsed_data = JSON.parse(json_data)
      teacher = Teacher.from_json(json_data)

      expect(teacher).to be_a(Teacher)
      expect(teacher.age).to eq(parsed_data['age'])
      expect(teacher.name).to eq(parsed_data['name'])
      expect(teacher.instance_variable_get(:@parent_permission)).to eq(parsed_data['parent_permission'])
      expect(teacher.instance_variable_get(:@specialization)).to eq(parsed_data['specialization'])
    end
  end
end