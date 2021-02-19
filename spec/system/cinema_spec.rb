require 'rails_helper'
RSpec.describe '映画機能', type: :system do
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
    visit new_user_session_path
    fill_in 'session_name', with: 'ユーザー1'
    fill_in 'session_password', with: 'hogehoge'
    click_button 'Log in'
    expect(page).to have_content '映画一覧'
    expect(page).to have_content 'ログインしました。'
    expect(page).to have_link '映画投稿'
  end
  describe '映画の新規投稿テスト' do
    context '映画を新規投稿した場合' do
      it '映画一覧、マイページに反映される' do
        click_link 'post_cinema'
        fill_in 'new_title', with: 'cinema_title_10'
        fill_in 'new_url', with: 'https://cinema/title/10'
        click_button '新規投稿'
        expect(page).to have_content '映画一覧'
        expect(page).to have_content '映画を登録しました'
        click_link 'header_mypage'
        expect(page).to have_content 'ユーザー詳細'
        expect(page).to have_content 'ユーザー1'
        expect(page).to have_content 'user1@hoge.jp'
        expect(page).to have_content 'cinema_title_1'
        expect(page).to have_content 'cinema_title_4'
        expect(page).to have_content 'cinema_title_7'
        expect(page).to have_content 'cinema_title_10'
        cinema = Cinema.find_by(title: 'cinema_title_10')
        click_link 'mypage_show', href: cinema_path(cinema.id)
        expect(page).to have_content '映画詳細'
        expect(page).to have_content 'cinema_title_10'
        expect(page).to have_content 'https://cinema/title/10'
      end
    end
  end
  describe '映画の詳細テスト' do
    context '映画一覧から詳細ボタンを押した場合' do
      it '映画詳細画面が表示される' do
        # all('tbody tr')[2].click_link '詳細'
        cinema = Cinema.find_by(title: 'cinema_title_7')
        click_link 'index_show', href: cinema_path(cinema.id)
        expect(page).to have_content '映画詳細'
        expect(page).to have_content 'cinema_title_7'
        expect(page).to have_content 'https://eiga.com/movie/91691/'
        click_link 'show_url'
        # 全てのタブを取得
        windows = page.driver.browser.window_handles
        # 最後に開いたタブに移動=リンククリックで開いたタブ
        page.driver.browser.switch_to.window(windows.last)
        # URLを検証（ここは自由に検証を）
        expect(current_url).to eq "https://eiga.com/movie/91691/"
        # 現在表示中のタブ=リンククリックで開いたタブをクローズ（これをしないとゴミのタブがたまる）
        page.driver.browser.close
        # 元いたタブに戻る
        page.driver.browser.switch_to.window(windows.first)
      end
    end
  end
  describe '映画の編集テスト' do
    context '映画一覧から編集ボタンを押した場合' do
      it '映画の編集ができる' do
        cinema = Cinema.find_by(title: 'cinema_title_4')
        click_link 'index_edit', href: edit_cinema_path(cinema.id)
        expect(page).to have_content '映画編集'
        fill_in 'update_title', with: 'cinema_title_4-4'
        fill_in 'update_url', with: 'https://cinema/title/4-4'
        click_button '編集する'
        expect(page).to have_content '映画を編集しました'
        click_link 'index_show', href: cinema_path(cinema.id)
        expect(page).to have_content 'cinema_title_4-4'
        expect(page).to have_content 'https://cinema/title/4-4'
      end
    end
  end
  describe '映画の削除テスト' do
    context '映画一覧から削除ボタンを押した場合' do
      it '映画の削除ができる' do
        click_link 'header_mypage'
        expect(page).to have_content 'cinema_title_1'
        click_link 'header_cinema_index'
        cinema = Cinema.find_by(title: 'cinema_title_1')
        page.accept_confirm do
          click_link 'index_delete', href: cinema_path(cinema.id)
        end
        expect(page).to have_content '映画を削除しました'
        click_link 'header_mypage'
        expect(page).not_to have_content 'cinema_title_1'
      end
    end
  end
  describe '映画の検索テスト' do
    before do
      user4 = FactoryBot.create(:user_case4)
      FactoryBot.create(:cinema_case10, user: user4)
      FactoryBot.create(:cinema_case11, user: user4)
    end
    context '検索ワードがブランクの場合' do
      it '全ての映画が表示される' do
        click_button '検索'
        expect(page).to have_content 'cinema_title_1'
        expect(page).to have_content 'cinema_title_2'
        expect(page).to have_content 'cinema_title_3'
        expect(page).to have_content 'cinema_title_4'
        expect(page).to have_content 'cinema_title_5'
        expect(page).to have_content 'cinema_title_6'
        expect(page).to have_content 'cinema_title_7'
        expect(page).to have_content 'cinema_title_8'
        expect(page).to have_content 'cinema_title_9'
        expect(page).to have_content '面白い映画'
        expect(page).to have_content '面白くない映画'
      end
    end
    context '検索ワードに該当する映画が1件の場合' do
      it '該当する1件の映画が表示される' do
        fill_in 'search_title', with: '面白い'
        click_button '検索'
        expect(page).to have_content '面白い映画'
        expect(page).not_to have_content 'cinema_title'
        expect(page).not_to have_content '面白くない'
      end
    end
    context '検索ワードに該当する映画が2件の場合' do
      it '該当する2件の映画が表示される' do
        fill_in 'search_title', with: '映画'
        click_button '検索'
        expect(page).to have_content '面白い映画'
        expect(page).to have_content '面白くない映画'
        expect(page).not_to have_content 'cinema_title'
      end
    end
  end
  describe '映画のおすすめテスト' do
    context 'おすすめページに遷移した場合' do
      it '自分が登録した映画のうち1件の映画タイトルが表示される' do
        click_link 'header_cinema_suggestion'
        expect(page).to have_content('cinema_title_1').or have_content('cinema_title_4').or have_content('cinema_title_7')
      end
    end
    context '違う映画ボタンを押した場合' do
      it '自分が登録した映画のうち1件の映画タイトルが表示される' do
        click_link 'header_cinema_suggestion'
        5.times {
          click_link 'repeat_suggestion'
          expect(page).to have_content('cinema_title_1').or have_content('cinema_title_4').or have_content('cinema_title_7')
        }
      end
    end
  end
end
