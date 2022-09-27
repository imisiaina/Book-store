require_relative '../lib/book_repository'

RSpec.describe 'BookRepository' do
  def reset_books_table
    seed_sql = File.read('spec/seeds_book_store.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it "returns the list of all books in the database" do
    repo = BookRepository.new
    books = repo.all
    expect(books.length).to eq 5
    expect(books[0].id).to eq  '1'
    expect(books[0].title).to eq 'Nineteen Eighty-Four'
    expect(books[0].author_name).to eq 'George Orwell'

    expect(books[1].id).to eq  '2'
    expect(books[1].title).to eq 'Mrs Dalloway'
    expect(books[1].author_name).to eq 'Virginia Woolf'

    expect(books[2].id).to eq  '3'
    expect(books[2].title).to eq 'Emma'
    expect(books[2].author_name).to eq 'Jane Austen'

  end
end
