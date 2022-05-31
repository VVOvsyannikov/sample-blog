require 'rails_helper'

feature 'Comment Creation' do
  before(:each) do
    sign_up
  end

  scenario 'allows user to create new comment' do
    visit new_article_path

    fill_in :article_title, with: 'Article title'
    fill_in :article_text, with: 'something'

    click_button 'Save Article'

    fill_in :comment_body, with: 'something'

    click_button 'Create Comment'

    expect(page).to have_content 'something'
  end
end
