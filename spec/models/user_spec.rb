require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: '', email: 'hoge@hoge.jp', password: 'hogehoge')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの名前が20文字の場合' do
      it 'バリデーションが通る' do
        user = User.create(name: 'a'*20, email: 'hoge@hoge.jp', password: 'hogehoge')
        expect(user).to be_valid
      end
    end
    context 'ユーザーの名前が21文字以上の場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: 'a'*21, email: 'hoge@hoge.jp', password: 'hogehoge')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの名前が重複している場合' do
      it 'バリデーションに抵触' do
        user1 = User.create(name: 'aaa', email: 'hoge1@hoge.jp', password: 'hogehoge')
        user2 = User.create(name: 'aaa', email: 'hoge2@hoge.jp', password: 'hogehoge')
        expect(user1).to be_valid
        expect(user2).not_to be_valid
      end
    end
    context 'ユーザーのemailが空の場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: 'aaa', email: '', password: 'hogehoge')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのemailが正規表現に則っていない場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: 'aaa', email: 'mmm', password: 'hogehoge')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのemailが30文字の場合' do
      it 'バリデーションが通る' do
        user = User.create(name: 'aaa', email: '111111111111111111hoge@hoge.jp', password: 'hogehoge')
        expect(user).to be_valid
      end
    end
    context 'ユーザーのemailが31文字以上の場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: 'aaa', email: '1111111111111111111hoge@hoge.jp', password: 'hogehoge')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーのemailが重複している場合' do
      it 'バリデーションに抵触' do
        user1 = User.create(name: 'aaa', email: 'hoge@hoge.jp', password: 'hogehoge')
        user2 = User.create(name: 'bbb', email: 'hoge@hoge.jp', password: 'hogehoge')
        expect(user1).to be_valid
        expect(user2).not_to be_valid
      end
    end
    context 'ユーザーのパスワードが16文字の場合' do
      it 'バリデーションが通る' do
        user = User.create(name: 'aaa', email: 'hoge@hoge.jp', password: 'hogehogehogehoge')
        expect(user).to be_valid
      end
    end
    context 'ユーザーのパスワードが17文字以上の場合' do
      it 'バリデーションに抵触' do
        user = User.create(name: 'aaa', email: 'hoge@hoge.jp', password: 'hogehogehogehogeh')
        expect(user).not_to be_valid
      end
    end
  end
end
