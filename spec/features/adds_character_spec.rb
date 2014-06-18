require 'rails_helper'

feature 'User adds a character to a TV show', %Q{
  As a site visitor
  I want to add my favorite TV show characters
  So that other people can enjoy their crazy antics} do

  scenario 'user adds new character' do
    character_attrs = {
      character_name: 'Bob Robers',
      actor_name: 'Chuck Noris',
      description: 'This is a description.'
    }
      television_show_attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }
    television_show = TelevisionShow.create(television_show_attrs)
    character = Character.new(character_attrs)
    visit "/television_shows/#{television_show.id}"
    fill_in 'Character name',   with: character.character_name
    fill_in "Actor name", with: character.actor_name
    click_on 'Submit'
    expect(page).to have_content 'Success'
  end

   scenario 'user receives an error message if required information is not provided' do
    television_show_attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }
    television_show = TelevisionShow.create(television_show_attrs)
    visit "/television_shows/#{television_show.id}"
    click_on 'Submit'
    expect(page).to_not have_content 'Success'
   end

  scenario 'User receives an error message if the character already exists' do
    character_attrs = {
      character_name: 'Bob Robers',
      actor_name: 'Chuck Noris',
      description: 'This is a description.'
    }

    television_show_attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    television_show = TelevisionShow.create(television_show_attrs)
    character = television_show.characters.create(character_attrs)

    visit "/television_shows/#{television_show.id}"
    fill_in 'Character name',   with: character.character_name
    fill_in "Actor name", with: character.actor_name
    fill_in 'Description', with: character.description
    click_on 'Submit'
    expect(page).to have_content 'has already been taken'

  end
end
