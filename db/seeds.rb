@count = 1
10.times do |n|
  name = "hoge#{@count}"
  email = "#{name}@hoge.jp"
  password = "hogehoge"
  @user = User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
  @count += 1
end

#1
Cinema.create(
  title: "花束みたいな恋をした",
  url: "https://eiga.com/movie/92102/",
  user_id: "1"
)
Cinema.create(
  title: "すばらしき世界",
  url: "https://eiga.com/movie/92069/",
  user_id: "1"
)
Cinema.create(
  title: "ファーストラヴ",
  url: "https://eiga.com/movie/92144/",
  user_id: "1"
)
Cinema.create(
  title: "ドラえもん2",
  url: "https://eiga.com/movie/92349/",
  user_id: "1"
)
Cinema.create(
  title: "夏目友人帳",
  url: "https://eiga.com/movie/93796/",
  user_id: "1"
)
Cinema.create(
  title: "おもいで写眞",
  url: "https://eiga.com/movie/94039/",
  user_id: "1"
)
Cinema.create(
  title: "ダニエル",
  url: "https://eiga.com/movie/94038/",
  user_id: "1"
)
Cinema.create(
  title: "KCIA 南山の部長たち",
  url: "https://eiga.com/movie/93972/",
  user_id: "1"
)
Cinema.create(
  title: "ある日どこかで",
  url: "https://eiga.com/movie/42253/",
  user_id: "1"
)
Cinema.create(
  title: "心の傷を癒すということ",
  url: "https://eiga.com/movie/94314/",
  user_id: "1"
)
Cinema.create(
  title: "滝沢歌舞伎",
  url: "https://eiga.com/movie/93221/",
  user_id: "1"
)
Cinema.create(
  title: "聖なる犯罪者",
  url: "https://eiga.com/movie/93746/",
  user_id: "1"
)
Cinema.create(
  title: "おとなの事情",
  url: "https://eiga.com/movie/93446/",
  user_id: "1"
)

#2
Cinema.create(
  title: "樹海村",
  url: "https://eiga.com/movie/92778/",
  user_id: "2"
)
Cinema.create(
  title: "ヤクザと家族 The Family",
  url: "https://eiga.com/movie/93189/",
  user_id: "2"
)
Cinema.create(
  title: "えんとつ町のプペル",
  url: "https://eiga.com/movie/92351/",
  user_id: "2"
)
#3
Cinema.create(
  title: "劇場版「鬼滅の刃」無限列車編",
  url: "https://eiga.com/movie/91918/",
  user_id: "3"
)
Cinema.create(
  title: "名探偵コナン 緋色の不在証明",
  url: "https://eiga.com/movie/94478/",
  user_id: "3"
)
Cinema.create(
  title: "哀愁しんでれら",
  url: "https://eiga.com/movie/93118/",
  user_id: "3"
)
#4
Cinema.create(
  title: "名も無き世界のエンドロール",
  url: "https://eiga.com/movie/93357/",
  user_id: "4"
)
Cinema.create(
  title: "天外者",
  url: "https://eiga.com/movie/93800/",
  user_id: "4"
)
Cinema.create(
  title: "さんかく窓の外側は夜",
  url: "https://eiga.com/movie/92501/",
  user_id: "4"
)
#5
Cinema.create(
  title: "約束のネバーランド",
  url: "https://eiga.com/movie/91873/",
  user_id: "5"
)
Cinema.create(
  title: "Endless SHOCK",
  url: "https://eiga.com/movie/94463/",
  user_id: "5"
)
Cinema.create(
  title: "銀魂 THE FINAL",
  url: "https://eiga.com/movie/91638/",
  user_id: "5"
)
#6
Cinema.create(
  title: "新解釈・三國志",
  url: "https://eiga.com/movie/91340/",
  user_id: "6"
)
Cinema.create(
  title: "ヲタクに恋は難しい",
  url: "https://eiga.com/movie/89816/",
  user_id: "6"
)
Cinema.create(
  title: "イルミナティ",
  url: "https://eiga.com/movie/94074/",
  user_id: "6"
)
#7
Cinema.create(
  title: "岸辺の旅",
  url: "https://eiga.com/movie/80556/",
  user_id: "7"
)
Cinema.create(
  title: "マーメイド・イン・パリ",
  url: "https://eiga.com/movie/93985/",
  user_id: "7"
)
Cinema.create(
  title: "劇場版ポケットモンスター",
  url: "https://eiga.com/movie/92350/",
  user_id: "7"
)
#8
Cinema.create(
  title: "犬鳴村",
  url: "https://eiga.com/movie/90455/",
  user_id: "8"
)
Cinema.create(
  title: "カイジ ファイナルゲーム",
  url: "https://eiga.com/movie/91314/",
  user_id: "8"
)
Cinema.create(
  title: "美少女戦士セーラームーン前編",
  url: "https://eiga.com/movie/89429/",
  user_id: "8"
)
#9
Cinema.create(
  title: "美少女戦士セーラームーン後編",
  url: "https://eiga.com/movie/89430/",
  user_id: "9"
)
Cinema.create(
  title: "新感染半島",
  url: "https://eiga.com/movie/93278/",
  user_id: "9"
)
Cinema.create(
  title: "私は確信する",
  url: "https://eiga.com/movie/93977/",
  user_id: "9"
)
#10
Cinema.create(
  title: "ノンストップ",
  url: "https://eiga.com/movie/94363/",
  user_id: "10"
)
Cinema.create(
  title: "アリー スター誕生",
  url: "https://eiga.com/movie/88415/",
  user_id: "10"
)
Cinema.create(
  title: "プリンセス・プリンシパル",
  url: "https://eiga.com/movie/89136/",
  user_id: "10"
)
