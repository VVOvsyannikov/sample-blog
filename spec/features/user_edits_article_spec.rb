require 'rails_helper'

feature 'Article Edit' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to edit article' do
    visit new_article_path

    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'something'
    click_button 'Save Article'

    visit articles_path

    find_button('Edit').click

    fill_in :article_text, with: 'something new'

    click_button 'Save Article'

    expect(page).to have_content 'something new'
  end
end
