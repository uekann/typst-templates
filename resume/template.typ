#let systemFontSize = 8pt
#let nameFontSize = 16pt
#let inputFontSize = 10pt

#let addSpace(input) = {
  box(
    [#pad(left:1cm,[#input])],
  )
}

#let personal_info(first_name_kana: "", last_name_kana: "", first_name: "", last_name: "", birth_date: "", age: 0) = {
  stack(
    place(
      top + right,
      dy: -10pt,
      datetime.today().display(
        "[year]年[month]月[day]日現在",
      )
    ),
    rect(
      stroke: (
        bottom: none,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: auto,
      width: 100%,
      [
        #grid(
          columns: (1.5cm,4cm,1fr),
          [ふりがな],
          [#align(center,first_name_kana)],
          [#align(start,last_name_kana)]
        )
      ] 
    ),
    line(
      length: 100%,
      stroke: (
        dash:"dashed",
      )
    ),
    rect(
      stroke: (
        bottom: 0.5pt,
        top: none,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: auto,
      width: 100%,
      [
        #align(top,
          grid(
            columns: (1.5cm,4cm,1fr),
            [氏 #h(0.6cm)名],
            [
              #pad(y: 0.4cm,align(center + horizon,text(nameFontSize,first_name)))
            ],
            [
              #pad(y: 0.4cm,align(start + horizon,text(nameFontSize,last_name)))
            ]
              
          )
        )
      ]
    ),
    stack(
      dir: ltr,
      rect(
        stroke: (
          bottom: 0.5pt,
          top: none,
          left: 1.5pt,
          right: 0.5pt
        ),
        height: auto,
        width: 80%,
        [
          #align(start + top,
            grid(
            columns: (1.5cm,1fr),
            [生年月日],
              pad(
                y: 0.2cm,
                left: -0.3cm,
                [#addSpace(text(inputFontSize,[#birth_date 生 #h(0.6cm) (満 #h(0.5em) #age 才)]))]
              )
            )
          )
        ]
      ),
      rect(
        stroke: (
          bottom: 0.5pt,
          top: none,
          left: none,
          right: 1.5pt
        ),
        width: 20%,
        height: auto,
        [
          #align(start + top,
            grid(
            columns: (1.0cm,2.0cm),
            [性別],
              pad(
                y: 0.2cm,
                [#text(inputFontSize,[男])]
              )
            )
          )
        ]
      )
    )
  )
}

#let photo(image_path: "") = {
  set text(size: 7pt)
  pad(
    bottom: 0.3cm,
    left: 0.4cm,
    box(
      stroke: (
        dash:"dashed",
      ),
      height: 4cm,
      width: 3cm,
      [
        #if (image_path == ""){
          align(
            center + horizon,
            [
              写真を貼る位置\
              (縦 40mm, 横 30mm)
            ]
          )
        } else {
          image(image_path, width: 3cm, height: 4cm)
        }
      ]
    )
  )
}

#let address(address1_kana: "", address1: "", address2_kana: "", address2: "", postal_code1: "", postal_code2: "", phone1: "", email1: "", phone2: "", email2: "") = {
  stack(
    grid(
      columns: (5fr,2fr),
      [
        #stack(
          rect(
            stroke: (
              bottom: none,
              top: none,
              left: 1.5pt,
              right: 0.5pt
            ),[
              #grid(
                columns: (1.5cm,1fr),
                [ふりがな],
                [#align(center,address1_kana)]
              )
            ]
          ),
          line(stroke: (dash:"dashed"), length: 100%)
        )
      ],
      [
        #rect(
          width: 100%,
          stroke: (
            bottom: 0.5pt,
            top: 1.5pt,
            left: none,
            right: 1.5pt
          ),[
          電話 #h(10pt) #phone1
          ]
        )
      ]
    ),
    grid(
      columns: (5fr,2fr),
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: 0.5pt,
            top: none,
            left: 1.5pt,
            right: 0.5pt
          ),[
            #if (postal_code1 == "") {
              [現住所 (〒 #h(20pt) - #h(20pt))]
            } else {
              [現住所 (〒 #text(tracking: 1pt,systemFontSize,postal_code1))]
            }
            #pad(y: 0.2cm ,align(center,text(inputFontSize,address1)))
          ]
        )
      ],
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: 0.5pt,
            top: none,
            left: none,
            right: 1.5pt
          ),[
            E-mail
            #pad(y: 0.3cm ,align(center,email1))
          ]
        )
      ]
    ),
    grid(
      columns: (5fr,2fr),
      [
        #stack(
          rect(
            stroke: (
              bottom: none,
              top: none,
              left: 1.5pt,
              right: 0.5pt
            ),[
              #grid(
                columns: (1.5cm,1fr),
                [ふりがな],
                [#align(center,address2_kana)]
              )
            ]
          ),
          line(stroke: (dash:"dashed"), length: 100%)
        )
      ],
      [
        #rect(
          width: 100%,
          stroke: (
            bottom: 0.5pt,
            top: none,
            left: none,
            right: 1.5pt
          ),[
          電話 #h(10pt) #phone2
          ]
        )
      ]
    ),
    grid(
      columns: (5fr,2fr),
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: 1.5pt,
            top: none,
            left: 1.5pt,
            right: 0.5pt
          ),[
           #if (postal_code2 == "") {
              [連絡先 (〒 #h(20pt) - #h(20pt))]
            } else {
              [連絡先 (〒 #text(tracking: 1pt,systemFontSize,postal_code2))]
            }
            #pad(y: 0.2cm ,align(center,text(inputFontSize,address2)))
          ]
        )
      ],
      [
        #rect(
          width: 100%,
          height: 1.8cm,
          stroke: (
            bottom: 1.5pt,
            top: none,
            left: none,
            right: 1.5pt
          ),[
            E-mail
            #pad(y: 0.3cm ,align(center,email2))
          ]
        )
      ]
    )
  )
}

#let education(year: 0, month: 0, description: "") = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,if year == 0 { "" } else { str(year) })
    ],
    [
      #align(center,if month == 0 { "" } else { str(month) })
    ],
    [
      #if (year == 0 and month == 0 and description == "") {
        align(center,[学歴])
      } else {
        align(start + horizon,[#h(5pt)#description])
      }
    ]
  )
}

#let work_experience(year: 0, month: 0, description: "") = {
  set text(inputFontSize) 
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,if year == 0 { "" } else { str(year) })
    ],
    [
      #align(center,if month == 0 { "" } else { str(month) })
    ],
    [
      #if (year == 0 and month == 0 and description == "") {
        align(center,[職歴])
      } else {
        align(start + horizon,[#h(5pt)#description])
      }
    ]
  )
}

#let qualification(year: 0, month: 0, description: "") = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [
      #align(center,if year == 0 { "" } else { str(year) })
    ],
    [
      #align(center,if month == 0 { "" } else { str(month) })
    ],
    [
      #align(start + horizon,[#h(5pt)#description])
    ]
  )
}

#let end_of_list() = {
  set text(inputFontSize)
  grid(
    columns: (1.5cm,0.8cm,1fr),
    [],
    [],
    [
      #align(end + horizon,[以上#h(2cm)])
    ]
  )
}

// mode: "学歴・職歴" or "資格"
#let career_section(children, height_length: 12.6cm, columns: 0, mode: "") = {
  stack(
    box(
      stroke: (
        bottom: 1.5pt,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: height_length,
      width: 100%,
      [
        #grid(
          columns: (1.5cm,0.8cm,1fr),
          [
            #rect(
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: 0.5pt
              ),
              height: 100%,
              width: 100%,
              [
                #align(center,[年])
              ]
            )
          ],
          [
            #rect(
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: 0.5pt
              ),
              height: 100%,
              width: 100%,
              [
                #align(center,[月])
              ]
            )
          ],
          [
            #rect(
              width: 100%,
              height: 100%,
              stroke: (
                bottom: none,
                top: none,
                left: none,
                right: none,
              ),
              align(center,[
                #if (mode == "学歴・職歴") {
                  [学歴・職歴(各別にまとめて書く)]
                } else if (mode == "資格") {
                  [免許・資格]
                }]
              )
            )
          ]
        )
        #place(
          start + top,
          dy: 10pt,
          [
            #let n = 0
            #while n < columns {
              [#pad(y: 0.26cm,line(stroke: 0.5pt, length: 100%))]
              n = n + 1
            }
          ]
        )
        #place(
          top + left,
          dy: 0.9cm,
        children
        )
      ]
    ),
  )
}

#let motivation(children) = {
  stack(
    rect(
      stroke: (
        bottom: 1.5pt,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: 5cm,
      width: 100%,
      [
        志望の動機、特技、好きな学科、アピールポイントなど
        #linebreak()
        #set text(inputFontSize)
        #children
      ]
    )
  )
}

#let personal_request(children) = {
  stack(
    rect(
      stroke: (
        bottom: 1.5pt,
        top: 1.5pt,
        left: 1.5pt,
        right: 1.5pt
      ),
      height: 5cm,
      width: 100%,
      [
        本人希望記入欄(特に給料・職種・勤務時間・勤務地・その他についての希望があれば記入)
        #linebreak()
        #set text(inputFontSize)
        #children
      ]
    )
  )
}

// 履歴書の全体構造を定義する関数
#let resume(
  first_name_kana: "りれきしょ",
  last_name_kana: "たろう", 
  first_name: "履歴書",
  last_name: "太郎",
  birth_date: "1990年1月1日",
  age: 99,
  photo_path: "",
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
  education_work_content,
  qualification_content,
  motivation_content,
  personal_request_content
) = {
  set text(font: "Hiragino Mincho ProN", size: systemFontSize)
  set page(paper: "jis-b5", margin: 1.5cm)
  
  let title = text(tracking: 1em, size: 14pt, [履歴書])
  
  // 1ページ目
  [= #title]
  
  move(dy: -1cm,
    stack(
      align(bottom,
        grid(
          columns: (5fr, 2fr),
          personal_info(
            first_name_kana: first_name_kana,
            last_name_kana: last_name_kana,
            first_name: first_name,
            last_name: last_name,
            birth_date: birth_date,
            age: age
          ),
          if photo_path == "" { photo() } else { photo(image_path: photo_path) }
        ),
      ),
      address(
        address1_kana: address1_kana,
        address1: address1,
        postal_code1: postal_code1,
        phone1: phone1,
        email1: email1,
        address2_kana: address2_kana,
        address2: address2,
        postal_code2: postal_code2,
        phone2: phone2,
        email2: email2
      ),
      linebreak(),
      career_section(
        mode: "学歴・職歴",
        columns: 14,
        education_work_content
      ),
    ),
  )
  
  pagebreak()
  
  // 2ページ目
  stack(
    career_section(
      mode: "学歴・職歴",
      columns: 5,
      height_length: 5cm,
      linebreak(),
    ),
    linebreak(),
    career_section(
      mode: "資格",
      columns: 7,
      height_length: 6.6cm,
      qualification_content
    ),
    linebreak(),
    motivation(motivation_content),
    linebreak(),
    personal_request(personal_request_content),
    place(
      bottom + right,
      dy: 10pt,
      [Made with Typst]
    )
  )
}
