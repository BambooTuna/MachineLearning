# MachineLearning
このリポジトリの内容は試行錯誤しながら編集しているため、内容の保証はできません。
間違いの指摘などは大歓迎です！Twitter -> @take_btc

## ナイーブベイズ
### 概要
- 分類
教師あり学習

- 使い所
記事の内容から記事のカテゴリー判定
スパムメールの判定

### 入力
ある文(Content)とそれが属するカテゴリー(Category)の組みをNセット

### 出力
Contentが与えられた(一意)時の確率P(Category|Content)が一番大きいものを探し、
その時のCategoryをContentの最も属すと思われるCategoryとする。

例
```
Content=機械学習つらい

P(Scala|機械学習つらい) = 0.03
P(JAVA|機械学習つらい) = 0.02
P(Python|機械学習つらい) = 0.91

この場合CategoryはPythonと推定
```

### 学習
1. Contentを単語に品詞分解

2. 求めてたい確率分布を変形する
P(Category|Content) = P(Content|Category) * P(Category) / P(Content)

単語を全てお互いに独立しているとすると
P(Content|Category) = P(Word1|Category) * P(Word2|Category) * ... * P(WordN|Category)

例
```
CategoryがPythonの文章の単語を抽出したら以下のようになった
機械学習, コンパイル
P(Content|Python)
= P(機械学習|Python) * P(コンパイル|Python)
= 1 * 1/2
機械学習は全１回出現＆全てPythonで出現　→　P(機械学習|Python) = 1
コンパイルは全２回出現＆Pythonで１回出現　→　P(コンパイル|Python) = 1/2


CategoryがScalaの文章の単語を抽出したら以下のようになった
Java, コンパイル
P(Content|Scala)
= P(機械学習|Scala) * P(コンパイル|Scala)
= 1 * 1/2
Javaは全１回出現＆全てScalaで出現　→　P(Java|Scala) = 1
コンパイルは全２回出現＆Scalaで１回出現　→　P(コンパイル|Scala) = 1/2

```
