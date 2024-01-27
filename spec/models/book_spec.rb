require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:example) do
   @book = Book.create( name: 'The Doctor',
                        cover_photo: 'test2.png',
                        author: 'THE Medic',
                        publisher: 'One',
                        publish_date: '2021-01-01',
                        category: 'Fiction',
                        info: 'This is a testing side of info')
  end
  describe ' is' do
    it ' valid' do
      expect(@book).to be_valid
    end
    it ' not valid if name lease that 3' do
      @book.name = 'ai'
      expect(@book).not_to be_valid
    end
    it ' not valid if name nil' do
      @book.name = nil
      expect(@book).not_to be_valid
    end
    it ' not valid if cover photo lease that 3' do
      @book.cover_photo = 'ai'
      expect(@book).not_to be_valid
    end
    it ' not valid if cover photo nil' do
      @book.cover_photo = nil
      expect(@book).not_to be_valid
    end
    it ' not valid if author lease that 3' do
      @book.author = 'ai'
      expect(@book).not_to be_valid
    end
    it ' not valid if author nil' do
      @book.author = nil
      expect(@book).not_to be_valid
    end
    it ' not valid if publisher lease that 3' do
      @book.publisher = 'ai'
      expect(@book).not_to be_valid
    end
    it ' not valid if publisher nil' do
      @book.publisher = nil
      expect(@book).not_to be_valid
    end

    it ' not valid if publish_date lease that 3' do
      @book.publish_date = '20'
      expect(@book).not_to be_valid
    end
    it ' not valid if publish_date nil' do
      @book.publish_date = nil
      expect(@book).not_to be_valid
    end
  end
end
