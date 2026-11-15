# 詞庫格式 / Dataset format

## `data/word-atlas.json`

一個陣列，按學習路線排序（CEFR 由易到難，同級內打散話題）。每個詞條：

| 欄位 | 型別 | 說明 |
| --- | --- | --- |
| `id` | string | URL 安全的唯一標識，同時是媒體檔名，例如 `principle`、`day-off` |
| `w` | string | 詞頭 |
| `uk` / `us` | string | 英式 / 美式 IPA，帶斜槓 |
| `senses` | `{pos, zh, en}[]` | 1–3 個義項：詞性、中文釋義、簡明英文釋義 |
| `ex` | `{en, zh}[]` | 兩條原創例句：`ex[0]` 日常短句，`ex[1]` 雅思語境長句 |
| `col` | string[] | 常用搭配，格式 `english｜中文` |
| `fam` | string[] | 詞族，格式 `word (pos)` |
| `syn` / `ant` | string[] | 近義 / 反義 |
| `tip` | string | 一條中文用法或辨析提示 |
| `cefr` | `A1`…`C2` | 估計難度 |
| `topic` | string | 19 個話題之一：education, work, technology, science, environment, health, society, government, economy, media, arts, travel, city, nature, daily, emotion, thinking, sport, history |
| `note` | string | 可選：用法提醒（冒犯性、過時用法、拼寫說明等） |

## `data/word-atlas.csv`

同樣內容的表格版，多值欄位用 ` | `、` ; ` 或 `, ` 連線，UTF-8 編碼。

## 網頁資料 `public/atlas/`

- `index.json`：緊湊索引，`words` 中每行為 `[id, word, zh, ipa, cefrIndex, topicIndex, media]`。`media` 是位標記：`1` 插畫、`2` 英音、`4` 美音、`8` 例句朗讀。
- `entries/<n>.json`：完整詞條，每塊 100 條，第 `n` 塊對應索引中第 `n*100` 到 `n*100+99` 行。
- `img/<id>.webp`（512px）、`thumb/<id>.webp`（256px）。
- `audio/uk/<id>.mp3`、`audio/us/<id>.mp3`、`audio/ex/<id>.mp3`（`ex[0]` 的朗讀）。

媒體覆蓋情況以 `index.json` 的位標記為準，不要假設每個詞都有全部檔案。

## 授權

CC BY 4.0，署名 “Word Atlas contributors”。見 [CONTENT_LICENSE.md](../CONTENT_LICENSE.md)。
