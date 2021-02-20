require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  before do
    user1 = FactoryBot.create(:user_case1)
    user2 = FactoryBot.create(:user_case2)
    user3 = FactoryBot.create(:user_case3)
    user5 = FactoryBot.create(:user_case5)
    FactoryBot.create(:cinema_case1, user: user1)
    FactoryBot.create(:cinema_case2, user: user2)
    FactoryBot.create(:cinema_case3, user: user3)
    FactoryBot.create(:cinema_case4, user: user1)
    FactoryBot.create(:cinema_case5, user: user2)
    FactoryBot.create(:cinema_case6, user: user3)
    FactoryBot.create(:cinema_case7, user: user1)
    FactoryBot.create(:cinema_case8, user: user2)
    FactoryBot.create(:cinema_case9, user: user3)
    FactoryBot.create(:cinema_case12, user: user5)
    FactoryBot.create(:cinema_case13, user: user5)
    FactoryBot.create(:cinema_case14, user: user5)
  end
  # save_and_open_page
  describe 'サインアップ、ログインのテスト' do
    context 'サインアップした場合' do
      it '映画一覧が表示される' do
        visit new_user_registration_path
        fill_in 'name', with: 'ユーザー'
        fill_in 'email', with: 'user@hoge.jp'
        fill_in 'password', with: 'hogehoge'
        fill_in 'password_confirmation', with: 'hogehoge'
        click_button 'Sign up'
        expect(page).to have_content '映画一覧'
        expect(page).to have_content 'アカウント登録が完了しました。'
        expect(page).to have_link '映画投稿'
        click_link 'header_Logout'
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
    context '未ログイン状態でタスク一覧に入ろうとした場合' do
      it 'ログイン画面が表示される' do
        visit cinemas_path
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
        expect(page).to have_button 'Log in'
      end
    end
    context '登録済みユーザーがログイン、ログアウトをした場合' do
      it 'ログイン、ログアウトができる' do
        visit new_user_session_path
        fill_in 'session_name', with: 'ユーザー1'
        fill_in 'session_password', with: 'hogehoge'
        click_button 'Log in'
        expect(page).to have_content '映画一覧'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_link '映画投稿'
        click_link 'header_Logout'
        expect(page).to have_content 'アカウント登録もしくはログインしてください。'
      end
    end
  end
  describe '登録済みユーザーのテスト' do
    before do
      visit new_user_session_path
      fill_in 'session_name', with: 'ユーザー1'
      fill_in 'session_password', with: 'hogehoge'
      click_button 'Log in'
      expect(page).to have_content '映画一覧'
      expect(page).to have_content 'ログインしました。'
      expect(page).to have_link '映画投稿'
    end
    context 'ログイン後の操作検証' do
      it 'マイページに投稿した作品がある' do
        click_link 'header_mypage'
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー1'
        expect(page).to have_content 'user1@hoge.jp'
        expect(page).to have_link 'プロフィールを編集'
        expect(page).to have_content 'cinema_title_1'
        expect(page).to have_content 'cinema_title_4'
        expect(page).to have_content 'cinema_title_7'
      end
      it '他ユーザーをフォローできる' do
        # all('tbody tr')[1].click_link 'ユーザー2'
        user2 = User.find_by(name: 'ユーザー2')
        all('tbody tr')[4].click_link 'index_user', href: user_path(user2.id)
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー2'
        expect(page).not_to have_content 'user2@hoge.jp'
        expect(page).not_to have_link 'プロフィールを編集'
        click_button 'follow'
        sleep 1.0
        click_link 'header_cinema_index'
        sleep 1.0
        # all('tbody tr')[0].click_link 'ユーザー3'
        user3 = User.find_by(name: 'ユーザー3')
        all('tbody tr')[3].click_link 'index_user', href: user_path(user3.id)
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー3'
        expect(page).not_to have_content 'user3@hoge.jp'
        expect(page).not_to have_link 'プロフィールを編集'
        click_button 'follow'
        sleep 1.0
        click_link 'header_cinema_index'
        sleep 1.0
        user5 = User.find_by(name: 'ユーザー5')
        all('tbody tr')[0].click_link 'index_user', href: user_path(user5.id)
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー5'
        expect(page).not_to have_content 'user5@hoge.jp'
        expect(page).not_to have_link 'プロフィールを編集'
        click_link 'header_mypage'
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー1'
        expect(page).to have_content 'user1@hoge.jp'
        expect(page).to have_link 'プロフィールを編集'
        find('label[for=tab2]').click
        expect(page).to have_content 'ユーザー2'
        expect(page).to have_content 'ユーザー3'
        expect(page).not_to have_content 'ユーザー5'
      end
      it 'マイプロフィールが編集できる' do
        click_link 'header_mypage'
        click_link 'update_profile'
        fill_in 'update_name', with: 'ユーザー1-1'
        fill_in 'update_email', with: 'user1-1@hoge.jp'
        click_button 'プロフィールを変更'
        expect(page).to have_content 'ユーザーを編集しました'
        expect(page).to have_content 'ユーザー1-1'
        expect(page).to have_content 'user1-1@hoge.jp'
      end
    end
  end
end
