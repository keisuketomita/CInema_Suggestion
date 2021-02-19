require 'rails_helper'
RSpec.describe Cinema, type: :model do
  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user_case1)
    end
    context '映画のタイトルが空の場合' do
      it 'バリデーションに抵触' do
        user = @user
        cinema = user.cinemas.build(title: '', url: 'https://eiga.com/', user_id: 1)
        expect(cinema).not_to be_valid
      end
    end
    context '映画のタイトルが30文字の場合' do
      it 'バリデーションが通る' do
        user = @user
        cinema = user.cinemas.build(title: 'a'*30, url: 'https://eiga.com/', user_id: 1)
        expect(cinema).to be_valid
      end
    end
    context '映画のタイトルが31文字以上の場合' do
      it 'バリデーションに抵触' do
        user = @user
        cinema = user.cinemas.build(title: 'a'*31, url: 'https://eiga.com/', user_id: 1)
        expect(cinema).not_to be_valid
      end
    end
    context '映画のurlが空の場合' do
      it 'バリデーションに抵触' do
        user = @user
        cinema = user.cinemas.build(title: '映画', url: '', user_id: 1)
        expect(cinema).not_to be_valid
      end
    end
    context '映画のurlが正規表現に則っていない場合' do
      it 'バリデーションに抵触' do
        user = @user
        cinema = user.cinemas.build(title: '映画', url: 'aaa://eiga.com/', user_id: 1)
        expect(cinema).not_to be_valid
      end
    end
    context '映画のurlが30文字の場合' do
      it 'バリデーションに通る' do
        user = @user
        cinema = user.cinemas.build(title: '映画', url: 'https://eiga.com/aaaaaaaaaaaaa', user_id: 1)
        expect(cinema).to be_valid
      end
    end
    context '映画のurlが31文字以上の場合' do
      it 'バリデーションに抵触' do
        user = @user
        cinema = user.cinemas.build(title: '映画', url: 'https://eiga.com/aaaaaaaaaaaaaa', user_id: 1)
        expect(cinema).not_to be_valid
      end
    end
  end
end
