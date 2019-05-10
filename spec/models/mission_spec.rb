require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe 'Astronaut stats' do
    it 'calculates average astronaut age' do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Rhonda Busar", age: 31, job: "Photographer")

      astronaut_1.missions << Mission.find_or_create_by(name: 'Apollo 13', duration: 100)
      astronaut_1.missions << Mission.find_or_create_by(name: 'Capricorn 4', duration: 200)
      astronaut_2.missions << Mission.find_or_create_by(name: 'Gemeni 7', duration: 300)

      expect(Mission.all.mission_sort).to eq(50)
    end
  end
end
