require 'rails_helper'

feature "Views list of characters", %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
} do

# Acceptance Criteria:
# * I can see a list of all the characters"
# * The character's name and the TV show it is associated with are listed

scenario "user can see a list of all the characters" do
  i = 1
  3.times do
    television_show_attrs = {
        title: "#{i}i Game of Thrones",
        network: "#{i}HBO",
        years: "#{i}2011",
        synopsis: "#{i} Seven noble families fight for control of the mythical land of Westeros."
    }

    character_attrs = {
        character_name: "#{i}Yoda",
        actor_name: "#{i}Frank Oz",
        description: "#{i}He is the master!"
    }


    tv_show = TelevisionShow.create(television_show_attrs)
    character = tv_show.characters.create(character_attrs)

    visit "/characters"
    expect(page).to have_content character.character_name
    expect(page).to have_content tv_show.title
    i += 1
    end
  end
end
