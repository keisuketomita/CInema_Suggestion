FactoryBot.define do
  factory :cinema_case1, class: Cinema do
    title { 'cinema_title_1' }
    url { 'https://cinema/title/1' }
    association :user
  end
  factory :cinema_case2, class: Cinema do
    title { 'cinema_title_2' }
    url { 'https://cinema/title/2' }
    association :user
  end
  factory :cinema_case3, class: Cinema do
    title { 'cinema_title_3' }
    url { 'https://cinema/title/3' }
    association :user
  end
  factory :cinema_case4, class: Cinema do
    title { 'cinema_title_4' }
    url { 'https://cinema/title/4' }
    association :user
  end
  factory :cinema_case5, class: Cinema do
    title { 'cinema_title_5' }
    url { 'https://cinema/title/5' }
    association :user
  end
  factory :cinema_case6, class: Cinema do
    title { 'cinema_title_6' }
    url { 'https://cinema/title/6' }
    association :user
  end
  factory :cinema_case7, class: Cinema do
    title { 'cinema_title_7' }
    url { 'https://eiga.com/movie/91691/' }
    association :user
  end
  factory :cinema_case8, class: Cinema do
    title { 'cinema_title_8' }
    url { 'https://cinema/title/8' }
    association :user
  end
  factory :cinema_case9, class: Cinema do
    title { 'cinema_title_9' }
    url { 'https://cinema/title/9' }
    association :user
  end
  factory :cinema_case10, class: Cinema do
    title { '面白い映画' }
    url { 'https://cinema/title/10' }
    association :user
  end
  factory :cinema_case11, class: Cinema do
    title { '面白くない映画' }
    url { 'https://cinema/title/11' }
    association :user
  end
  factory :cinema_case12, class: Cinema do
    title { 'cinema_title_12' }
    url { 'https://cinema/title/12' }
    association :user
  end
  factory :cinema_case13, class: Cinema do
    title { 'cinema_title_13' }
    url { 'https://cinema/title/13' }
    association :user
  end
  factory :cinema_case14, class: Cinema do
    title { 'cinema_title_14' }
    url { 'https://cinema/title/14' }
    association :user
  end

end
