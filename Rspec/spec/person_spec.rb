require 'json'
require 'rspec'
require_relative '../../classes/person'
require_relative '../../classes/book.rb'
describe Person do
  let(:age) { 20 }
  let(:name) { 'John Doe' }
  let(:parent_permission) { true }
  let(:person) { Person.new(age, name, parent_permission:) }
  describe '#initialize' do
    it 'sets the age, name, parent_permission, and rentals' do
      expect(person.age).to eq(age)
      expect(person.name).to eq(name)
      expect(person.instance_variable_get(:@parent_permission)).to eq(parent_permission)
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
    end
    it 'generates a random ID between 1 and 100' do
      expect(person.id).to be_an(Integer)
      expect(person.id).to be_between(1, 1000)
    end
  end
  describe '#can_use_services?' do
    it 'returns true if the person is 18 years or older' do
      person = Person.new(20)
      expect(person.can_use_services?).to be(true)
    end
    it 'returns true if the person is under 18 years but has parent permission' do
      person = Person.new(15, parent_permission: true)
      expect(person.can_use_services?).to be(true)
    end
    it 'returns false if the person is under 18 years and does not have parent permission' do
      person = Person.new(15, parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end
  describe '#correct_name' do
    it 'returns the person\'s name' do
      expect(person.correct_name).to eq(name)
    end
  end
  describe '#to_json' do
    it 'returns the person details as a JSON string' do
      expected_json = {
        'type' => 'Person',
        'id' => person.id,
        'age' => age,
        'name' => name,
        'parent_permission' => parent_permission
      }.to_json
      expect(person.to_json).to eq(expected_json)
    end
  end

  describe 'add_rental' do
    it 'Add rentals in the person rentals array' do
      book = Book.new("Fancy book", "Nice author")
      person.add_rental('22/09/2023', book)
      expect(person.rentals.length).to eq(2)
    end
  end
end
