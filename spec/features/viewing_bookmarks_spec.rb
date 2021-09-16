require 'pg'

feature 'viewing bookmarks' do
  scenario 'user is able to see their bookmarks' do
    
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.msn.com');")

    visit('/bookmarks')

    expect(page).to have_content 'http://www.msn.com'
    expect(page).to have_content 'http://www.google.com'
  end
end