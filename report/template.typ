#import "@preview/codelst:2.0.2": sourcecode

// レポートテンプレート関数
#let report(
  title: "タイトル",
  subtitle: "サブタイトル",
  info: (:), // 任意の情報を辞書形式で受け取る
  show-toc: false,
  body
) = {
  // フォント設定
  set text(font: ("New Computer Modern", "Hiragino Mincho ProN"), lang: "ja")

  // ページ番号設定
  set page(numbering: "1 / 1", number-align: center)

  // タイトル部分
  align(center)[
    #text(size: 24pt, weight: "bold")[#title]
    #v(0.1em)
    #text(size: 16pt)[#subtitle]
  ]

  // 情報表示（右揃え）
  if info != (:) [
    #align(right)[
      #table(
        columns: 2,
        stroke: none,
        align: (right, left),
        ..info.pairs().map(((key, value)) => ([#key :], [#value])).flatten()
      )
    ]
  ]

  // 見出し番号設定
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()
    if level == 1 {
      numbering("I.", ..nums)
    } else if level == 2 {
      numbering("A.", nums.pos().at(-1))
    } else if level == 3 {
      numbering("1.", nums.pos().at(-1))
    } else if level == 4 {
      numbering("i.", nums.pos().at(-1))
    }
  })

  // 見出し2以下の本文に自動でインデントを適用
  let current-heading-level = state("heading-level", 1)

  show heading: it => {
    current-heading-level.update(it.level)
    pad(
      top: 1em,
      bottom: 0.5em,
      left: (it.level - 1) * 1em,
      it
    )
  }

  show par: it => {
    context {
      let level = current-heading-level.get()
      let indent-amount = (level - 1) * 1em
      block(
        width: 100%,
        inset: (left: indent-amount),
        [#h(1em)#it.body]
      )
    }
  }

  // 目次
  if show-toc [
    #v(2em)
    #show outline.entry: it => {
      v(0.3em)
      it
      v(0.3em)
    }
    #outline(
      title: [目次], 
      depth: 3, 
      indent: 1em
    )
    #pagebreak()
  ]

  // 本文
  body
}
