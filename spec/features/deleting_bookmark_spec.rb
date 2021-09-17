feature 'delete a bookmark' do
  scenario 'user is able to delete a bookmark' do
    Bookmark.create(title: 'Reddit', url: 'http://www.reddit.com')
    visit('/bookmarks')
    expect(page).to have_link 'Reddit', href: 'http://www.reddit.com'

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link 'Reddit', href: 'http://www.reddit.com'
  end
end
