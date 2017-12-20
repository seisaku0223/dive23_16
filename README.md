# DIVE23 の学習事項

DIVE23 の学習事項


・実際の開発と同じ形式での開発
```
Github リポジトリ環境及び Collaborators の整備
```
・メンバー内で issue を分担
```
（開発方法の指定）デフォルトのissueを分担して行う。 
　　※必要に応じて、自分でissueを切り出しましょう。 できるだけ細かくきるのが理想。 
　　※ issue の書き出しには、 Markdown記法の利用が可能。 
　　　参考元： 「Githubでの issue管理方法（サンプル）」
　　　http://dev.classmethod.jp/tool/git/github-issue-driven-dev/
デザインに関しては、基本的に自分の割り当ての部分に最低限デフォルトではないデザインを当てるようにする。
コンフリクトは、基本的に起こした当人が解決する。
（コンフリクトが起きている部分のコードを確認し、他の人が書いたコードの下に自分のコードを追記するなどして対処する。）
コンフリクトを起こさないように、こまめなpushとpullを常に心がける。
```
・開発フローの実践（GithubFlow）
```
（開発方法の指定）issueごとに、pullrequestを出してレビューしてもらう。
 　　※レビュー担当者に必ずレビューしてもらうようにすること。
 　　　参考：「クックパッド開発者ブログ・たのしくなるコードレビュー」
 　　　http://techlife.cookpad.com/entry/2017/09/22/110000
```

開発は、

```
1.githubにあるmasterをgit pull origin masterでpullしてくる
（初回はcloneしてくる。originの設定はあらかじめ済ませておく）
2.ローカルでmasterからブランチを切り、実装をする。
3.実装が完了したらcommitし、git push origin <イシュー名>でpushする
4.githubでpullrequestを作成する
5.評価者のレビューとmasterへのマージを待つ（待つ間、1から別のコードの作成を進めていても構わない）
6.マージを確認後、1に戻る
```

という順番で行う

pullrequestは出す前に必ず実装確認し、記述したコードにエラーがないことを確認すること。
`エラーの出るコードでpullrequestを出すのはご法度です`

・検索する能力
```
Google検索エンジンを用いたコード検索
Github 内公開リポジトリを参考にしてのコード検索 
 　　※説明会開催時に、過去受講生のリポジトリ情報の開示あり。→「yasuhisa1984/dive-23-10」
 　　 ※今回はヒントとして事前開示しましたが、Github 検索バーに「DIVE 23」で検索をかけたところ、
上記リポジトリを含む「15個のリポジトリ」「440K個のcode」etc... が見つかる。 
 　　※検索ワードを半角スペースで並べれば、AND条件（かつ）となる。
 公開リポジトリの git clone 及びコード分析。
書籍を用いたコード検索
```
・課題の定義
```
stackoverflowcloneを時間内でできる限り作成すること
*  GithubのURL提出
```
・DIVE23 の目的
```
実際の案件に近いものを行うことで、いざ現場に出た時に即戦力となれるようにする。
自分で調べ、自分でチーム内の課題を解決する問題解決能力を養うため。
なお、「問題解決思考を養う」の定義は、弊社野呂がリクルート出身のため下記サイトを参考とする。
https://www.recruit-ms.co.jp/issue/feature/kaihatsu/200702/01.html
```
・DIVE23 参加条件（ノルマ）
```
週20時間以上開発に当てることができること
それまでの課題を全て突破していること
```

## アプリケーションの設定の注意点

（このチーム開発のアプリでは、これらの設定は事前に済ませてあります。）

・アプリケーションを作成する際、.envの設定は基本的に最初に済ませておくこと
・タイムゾーンの設定は基本的に日本にしておくこと
`config/application.rb`
```rb
config.time_zone = 'Tokyo'
config.active_record.default_timezone = :local
```
・ログレベルはinfoにしておくこと（本番環境でデバッグ情報を出すとLogで容量が圧迫される
ため）

`config/production.rb`
```rb
config.log_level = :info
```

# コードを書く際の注意点（基本的にこのルールを守って記述してください）

## コード

・Gemfileはコメント行をあらかじめ消しておくこと
・改行は意味のある単位で行なった方がみやすいため、そうすること
・Rspecを使うならtestディレクトリは消しておく
・意味のない空行は消しておく
・ロケット記法は使わないこと
・変数やアソシエーション名は、機能に関連した名前づけを心がけ、good_answersのようにスネークケースできちんと単語を分けること
・省略した命名は基本的に使わない(意味を予測しづらいため)
・createでrespond_toを使わなくなったのであればコメントアウトではなく削除をしておくこと
・privateより下の行はprivateと同じレベルのインデントにする
・ストロングパラメータに関するコメントは基本的に不要(コードを見ればわかるため)
・updateなどの記述の際、バリデーションが発火した時の処理も考慮しておくこと。
（レンダリングするviewが見つけられなくてエラーになったりしないように注意する）
・共同開発の場合、コミットメッセージは何をしたかがちゃんとわかるものをつけること

```rb
# NG
:hoge => true

# OK
hoge: true
```
・インデントは必ず綺麗につける
* Rubyはスペース2つをインデントのルールにする慣習がある
* Railsのコーディング規約、Rubyのコーディング規約は勉強になる(非公式ですが)
  * https://github.com/cookpad/styleguide/blob/master/ruby.ja.md
  * https://github.com/satour/rails-style-guide/blob/master/README-jaJA.md

・設定を一つだけ切り出したルーティングを設定したい場合などは
onオプションのcollectionとmemberを使うことを考える

```rb
resources :questions do
  get :search, on: :collection
end
```

・不要なcssやjsのファイルは削除しておくこと（ディレクトリ内の見通しがよくなるため）
 * cssはSMACSSやBEMといった設計手法があるので、それを考えて見るのはいいかも
     * SMACSS: https://app.codegrid.net/entry/smacss-1
     * BEM: https://app.codegrid.net/entry/bem-basic-1
  * config/application.rbでassetsの自動生成の抑制もできる
```rb
config.generators do |g|
  # その他generator設定
  g.assets     false
  g.helper     false
end
```

・スタイルは基本classに当てた方がよい。要素セレクタにスタイルを当てると影響度が大きくなる。

・db周りは、全体的に制約をしっかりつけることを心がけること
（ただし、どこまで制約で縛るかを作りたい機能と照らし合わせ、都度確認をする必要はある）
（例えばanswerに外部キー制約が付ける場合、ユーザーが削除されたら、そのユーザーが回答していたanswerも消える設計をしている認識で良いのか？という具合）

・application.rbでrails g実行時にassets周りのファイルを生成しない設定をしておくとよい

・scaffoldで生成されるcssは予期せぬ影響があるかもしれないため、基本的に削除しておくこと。また、jsonなどを使用しないのであればrespond_to周りは消しておいた方が良い。

・privateの下にクラスメソッドを定義してもprivateなメソッドにならないので注意
    * 参考：http://blog.agile.esm.co.jp/entry/2016/09/30/171444
    * クラスメソッドをプライベート化するためにはこんなかんじ

`また、共通で使う部分のコード（configやGemfileなど）は、役割の割り当てをしていないので、余力のある人が状況を見てイシューとプルリクを作成し、綺麗なコードにしてください`

## GitConflictの解消法例

## Conflict 発生時にローカル環境で実行する作業

・開発ブランチのバックアップを取る

```
$ git branch 　　　　#<< 開発ブランチに移動するため等で適宜確認
$ git checkout issues/#1
$ git checkout -b issues/#1fix　　#<< 開発ブランチのバックアップを生成
```

・conflictが起きてるGithubのmaster commit をローカルに git pull する。

```
$ git pull origin master　　#<< Githubから pull する
```

・ターミナルにconflict を知らせるメッセージが表示される。

```
（以下、Atomターミナルでの表示例）
　Auto-merging app/controllers/users_controller.rb
　CONFLICT (content): Merge conflict in app/controllers/users_controller.rb
```

・conflictした該当ファイルを探し、conflict 箇所のコードを適宜修正する。

```
　<<<<<<< issues/#1
　 @users = User.search(params[:search]).page(params[:page]).per(6)
　=======
　 @users = User.search(params[:search])
　>>>>>>> master
```

・conflict修正完了後、ローカル環境の開発ブランチからgit push する。

```
$ git add -A
$ git commit -m "fixed conflict"
$ git push origin issues/#1fix
```

Githubサイトにて、git push したcommitを選び、プルリクエストする。

・Githubサイトにアクセス
・「issues/#1fix」をプルリクエスト

## conflict 実例

「Auto-merging」が走っても解決しない conflict は、「CONFLICT (content): Merge conflict in ~」との形でファイル名単位で指摘される。そのconflict は、直接ファイルを開いて修正すれば、再 git push 時にconflictのない状態（＝マージ可能）へと更新できる。

```
$ git pull origin master From https://github.com/shomy/diveteam
branch master -> FETCH_HEAD
Auto-merging db/schema.rb
CONFLICT (content): Merge conflict in db/schema.rb
Auto-merging config/routes.rb
CONFLICT (content): Merge conflict in config/routes.rb
Auto-merging app/assets/javascripts/application.js
Auto-merging Gemfile.lock
Auto-merging Gemfile
CONFLICT (content): Merge conflict in Gemfile
Automatic merge failed; fix conflicts and then commit the result.
```

※この例では、「db/schema.rb」「config/routes.rb」「Gemfile」の3ファイルが指摘される。
・「db/schema.rb」は rake db:migrate:reset の実行で解消。
・「config/routes.rb」及び「Gemfile」は該当の conflict 箇所を修正する事で解消。

マイグレーションファイルが重複してconflict している場合

```
（ローカル環境の開発ブランチにて）
$ git pull origin master
=>
CONFLICT (content): Merge conflict in db/schema.rb
略

$ rake db:migrate:reset
=>
rake aborted!
ActiveRecord::DuplicateMigrationNameError:
Multiple migrations have the name AddNameToUsers
```

※このエラーについて、ここでは、「AddNameToUsers」を命令するマイグレーションファイルが二つ存在する状態のため、片方のファイルを削除して再度 rake db:migrate:reset を実行する。

※マイグレーションファイル名は違うものの、追加させるカラムが2つのファイルで重複した場合は、どちらかのマイグレーションファイルの中身を編集する。

※エラーメッセージ「Everything up-to-date」となった場合の対処方法の参考記事
http://azuuun-memorandum.hatenablog.com/entry/2016/12/21/005926
