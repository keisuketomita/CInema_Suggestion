FactoryBot.define do
  factory :user_case1, class: User do
    name { 'ユーザー1' }
    email { 'user1@hoge.jp' }
    password { 'hogehoge' }
  end
end
