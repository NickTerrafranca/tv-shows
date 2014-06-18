require 'rails_helper'

feature "View Character Information on TV Show's Page",
%Q{As a site visitor
I want to view the details for a TV show
So I can learn more about it
} do
# Acceptance Criteria:
# * I can see a the show's title, network, the years it ran, and a synopsis
# * For each character, I can see the character's name, actor's name, and the character's description

  scenario "user sees character details and tv show details" do

      television_show_attrs = {
          title: "Game of Thrones",
          network: "HBO",
          years: "2011",
          synopsis: "Seven noble families fight for control of the mythical land of Westeros."
      }

      character_attrs = {
          character_name: "Yoda",
          actor_name: "Frank Oz",
          description: "He is the master!"
      }

      tv_show = TelevisionShow.create(television_show_attrs)
      character = tv_show.characters.create(character_attrs)

      visit "/television_shows/#{tv_show.id}"

      expect(page).to have_content tv_show.title
      expect(page).to have_content tv_show.network
      expect(page).to have_content tv_show.years
      expect(page).to have_content tv_show.synopsis

      expect(page).to have_content character.character_name
      expect(page).to have_content character.actor_name
      expect(page).to have_content character.description

  end
end
