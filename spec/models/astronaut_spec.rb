require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Astronaut stats' do
    it 'calculates average astronaut age' do
      astronaut_1 = Astronaut.create(name: "Peter Williams", age: 49, job: "Plumber")
      astronaut_2 = Astronaut.create(name: "Rhonda Busar", age: 51, job: "Photographer")

      expect(Astronaut.all.average_age).to eq(50)
    end
  end
end
