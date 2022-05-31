require 'rails_helper'

feature 'Article Creation' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to visit new article page' do
    visit new_article_path
    expect(page).to have_content 'New article'
  end

  scenario 'allows user to create new article' do
    visit new_article_path

    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'something'

    click_button 'Save Article'

    expect(page).to have_content 'Article title'
  end
end
