require 'rails_helper'

describe "user visits /astronauts" do
  describe "user sees all astronauts and info" do
    it "displays all astronauts" do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Rhonda Busar", age: 31, job: "Photographer")

      visit '/astronauts'

      expect(page).to have_content("Name: #{astronaut_1.name}, Age: #{astronaut_1.age}, Job: #{astronaut_1.job}")
      expect(page).to have_content("Name: #{astronaut_2.name}, Age: #{astronaut_2.age}, Job: #{astronaut_2.job}")
    end

    it "displays average age of all astronauts" do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Rhonda Busar", age: 31, job: "Photographer")

      visit '/astronauts'

      expect(page).to have_content("Average Age: #{Astronaut.average_age}")
    end
  end

  describe "user sees space mission info" do
    it "displays all space missions in alphabetical order" do
      astronaut_1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astronaut_2 = Astronaut.create(name: "Rhonda Busar", age: 31, job: "Photographer")

      astronaut_1.missions << Mission.find_or_create_by(name: 'Apollo 13', duration: 100)
      astronaut_1.missions << Mission.find_or_create_by(name: 'Capricorn 4', duration: 200)
      astronaut_2.missions << Mission.find_or_create_by(name: 'Gemeni 7', duration: 300)

      visit '/astronauts'

      expect(page).to have_content("Apollo 13")
      expect(page).to have_content("Capricorn 4")
      expect(page).to have_content("Gemeni 7")
    end
  end
end
