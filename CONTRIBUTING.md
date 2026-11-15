# 參與貢獻 / Contributing

謝謝你願意讓詞光變得更好。

## 修正詞條

最有價值的貢獻是糾錯。請在 Issue 中寫明詞條 `id`、問題和建議的改法，或直接提交 PR：

1. 修改 `.local` 之外的源資料前，請先看 [docs/pipeline.md](docs/pipeline.md)。小修正可以直接改 `data/word-atlas.json` 與 `public/atlas/entries/` 中對應的條目，保持兩處一致。
2. 執行 `npm run check:atlas` 和 `npm test`。
3. 在 PR 裡說明修改理由，必要時附權威詞典連結。

## 程式碼

- TypeScript 嚴格模式，React 函式元件，不引入狀態管理或 UI 框架依賴。
- 保持“無賬號、本地優先、無追蹤”的方向。
- 視覺改動請同時檢查淺色、深色和 375px 手機寬度。
- 提交前執行 `npm test`、`npm run check:atlas`、`npm run build`。

## 新素材

新增圖片、錄音或文本時，請寫明來源與授權，只接受可以按 CC BY 4.0 再分發的內容。

## 安全

不要在 Issue、PR、截圖或日誌中貼上任何 API key。生成指令碼只從環境變數或倉庫外的檔案讀取憑據，見 [SECURITY.md](SECURITY.md)。
