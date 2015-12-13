# localwiki

_自分でカスタマイズし、自分だけのオリジナルウィキ_  
  
自分の理解している言葉で説明をすることで理解度を把握していき、肉付けしていくように学んでいく。
ローカル専用なので、思うまま自由に変な言葉も気にせず登録することができます。
自分のユーザ辞書を自動作成し、ハイパーリンク化して登録語彙同士で相互リンクさせています。
Mecabのインストールとパス設定を書き換えておけばすぐに使えると思います。

### 実行

```
bundle exec ruby main.rb
```

### 環境

* Ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]
* Sinatra 1.4.6
* sqlite3 1.3.11
* Mecab 0.996

### 補足

* Mecab  
Mecabをインストールする必要があります。私の環境下(MacOSX)では以下のパスですが、OSによって違います。  
`/usr/local/Cellar/mecab/0.996/libexec/mecab/mecab-dict-index -d /usr/local/Cellar/mecab/0.996/lib/mecab/dic/ipadic -u localwiki.dic -f utf-8 -t utf-8 localwiki.csv`
