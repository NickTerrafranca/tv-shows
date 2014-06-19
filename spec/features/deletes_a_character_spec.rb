require 'rails_helper'

feature "Delete a character",
%Q{As a site visitor
I want to delete a character.
}do
# Acceptance Criteria:
# * I can delete a character from the database
# * If the record is successfully deleted,
#  I receive an notice that it was deleted

scenario "User deletes character from database" do

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

  television_show = TelevisionShow.create(television_show_attrs)
  character = television_show.characters.create(character_attrs)
  prev_count = Character.count

  visit "/characters"
  click_on "Delete Character"
  expect(page).to have_content 'Your entry was deleted'
  expect(Character.count).to eq prev_count - 1
  end
end
