#How to use rails project!!

##実際にやること
###projectを立ち上げる
```
rails new projectName
```
```
これらが作成される
- Gemfile
- app
    |- assets
    |- controllers
    |- helpers
    |- models
    |- views
- config
    |- routes.rb
- db
```
###viewとcontrollerを作る
ユーザーの情報を表示するためのviewとcontrollerの場合  
複数系にする規約があるらしい
```
rails g controller users index show
```
これらができる

```
app/controllers/users_controller.rb   index,showで使う変数とか宣言
app/views/users/index.html.erb        ここでuser一覧表示？
app/views/users/show.html.erb         個人のuser情報表示
```

###サーバーの立ち上げ
```
どっちか
rails server
rails s
```

ここに行こう
```
http://0.0.0.0:3000/users/index
http://0.0.0.0:3000/users/show
```

###view(html)を書き換える
これ書き換えて
```
app/views/users/index.html.erb
app/views/users/show.html.erb
```

###urlの値でshowページの変化
つまり、これで
```
http://0.0.0.0:3000/users/show/hyoga
```
hyogaのページに行くようにしたい  
ここに行き
```
config/routes.rb
```
```
projectName::Application.routes.draw do
  get "users/index"
  get "users/show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  ...
end
```
↓
```
projectName::Application.routes.draw do
  get "users/index"
  get "users/show/:username" => "users#show"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  ...
end
```
ここでは、hyogaというusernameをusersのshowに行って代入してこいって感じ  
これでこれが表示されるはず
```
http://0.0.0.0:3000/users/show/hyoga
```


##View
###HTML内でのrubyのデータ埋め込む
これ↓の中に埋め込む
```
<%= %>
```

```
<!DOCTYPE>
<html>
  <head>
    ...
    ...
  </head>
  <body>
    <h1><%= @user[:name] %></h1>
    <p><%= @user[:username] %></p>
    <ul>
      <li>Location : <%= @user[:location] %></li>
      <li>About    : <%= @user[:about] %></li>
      </ul>
  </body>
</html>
```

##Controller
###viewで使う関数の宣言
controller上でこんな感じ  
データベースの情報を表示する  
ハッシュで表現される
```
def show
   @user = User.find_by(:username => params[:username])
end
```
- params[:username] : urlのパラメータを取得している
- User.find_by(:username => 'hyoga') : データベース内のusernameを検索
  - User.find_by(:name => 'Ryo Suzuki')
  - User.find_by(:name => 'Ryo Suzuki')
  - User.find(1)


##Model
###データベースをつくる
```
rake db:create
```

####migrationを作る  
ここでは、単数系
```
rails g model user name:string username:string location:string about:text
```

これができる
```
app/models/user.rb                              ここにuserのデータが保存される?ってわけじゃなかった
db/migrate/20130630062417_create_users.rb       スキーマの編集できる？
```

####migrateする
```
rake db:migrate
```

####データベースに初期データを入力する
これを編集する。
```
db/seeds.rb
```

このように
```
@user = User.new
@user.name = 'Hyoga Yoshida'
@user.location = 'Osaka, Japan'
@user.about = 'I am learning rails'
@user.save
```

これで完了
```
rake db:seed
```
