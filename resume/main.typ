#import "template.typ": *

// 使い方の説明
// 以下のresume関数の引数を変更してください

#resume(
  first_name_kana: "りれきしょ",
  last_name_kana: "たろう",
  first_name: "履歴書",
  last_name: "太郎",
  birth_date: "1990年1月1日",
  age: 99,
  gender: "男",
  // photo_path: "image/testImage.png", // 写真がある場合はコメントアウトを外す
  address1_kana: "とうきょうとすみだくおしあげ",
  address1: "東京都墨田区押上１丁目１−２",
  postal_code1: "131-0045",
  phone1: "123-4567-8901",
  email1: "sample@example.com",
  address2_kana: "",
  address2: "https://github.com/Nikudanngo/typst-ja-resume-template",
  postal_code2: "",
  phone2: "",
  email2: "",
  
  // 学歴・職歴
  grid(
    gutter: 0.61cm,
    education(),
    education(
      year: 1989,
      month: 10,
      description: "俺、爆誕"
    ),
    education(
      year: 2008,
      month: 3,
      description: "スクスク育つ"
    ),
    education(
      year: 2018,
      month: 4,
      description: "宇宙大学ツヨツヨ学部エンジニア学科 入学"
    ),
    education(
      year: 2019,
      month: 8,
      description: "大規模開発サークル設立 → サークル崩壊"
    ),
    linebreak(),
    work_experience(),
    work_experience(
      year: 2024,
      month: 4,
      description: "大手IT系メーカーベンチャー企業 就職"
    ),
    end_of_list()
  ),
  
  // 資格
  grid(
    gutter: 0.61cm,
    qualification(
      year: 1989,
      month: 12,
      description: "普通自動車免許 取得"
    ),
  ),
  
  // 志望動機
  [私がこの職に応募する理由は、],
  
  // 本人希望
  [私は〇〇がしたい]
)
