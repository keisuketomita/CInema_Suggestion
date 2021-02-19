FactoryBot.define do
  factory :user_case1, class: User do
    name { 'ユーザー1' }
    email { 'user1@hoge.jp' }
    password { 'hogehoge' }
  end
  factory :user_case2, class: User do
    name { 'ユーザー2' }
    email { 'user2@hoge.jp' }
    password { 'hogehoge' }
  end
  factory :user_case3, class: User do
    name { 'ユーザー3' }
    email { 'user3@hoge.jp' }
    password { 'hogehoge' }
  end
  factory :user_case4, class: User do
    name { 'ユーザー4' }
    email { 'user4@hoge.jp' }
    password { 'hogehoge' }
  end
  factory :user_case5, class: User do
    name { 'ユーザー5' }
    email { 'user5@hoge.jp' }
    password { 'hogehoge' }
  end
end
