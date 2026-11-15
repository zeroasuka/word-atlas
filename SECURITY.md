# 安全與隱私 / Security and privacy

## 資料去哪裡

詞光沒有賬號、伺服器端儲存、統計或追蹤。學習進度只儲存在當前瀏覽器的 localStorage，可以在「我的」裡匯出為 JSON 備份。匯入備份時會逐欄位校驗，畸形資料會被丟棄。

Word Atlas has no accounts, server-side storage, analytics or tracking. Progress lives in the browser's localStorage and can be exported as JSON. Imported backups are validated field by field.

## 憑據 / Credentials

網頁執行不需要任何 API key。只有 `scripts/atlas/` 中的內容生成指令碼需要呼叫模型服務，它們從環境變數（`SUB2_BASE_URL`、`SUB2_API_KEY`、`ELEVENLABS_API_KEY`）或倉庫外的目錄（`ATLAS_SECRETS`）讀取憑據，不會寫入倉庫。

- 不要使用 `VITE_*` 變數存放憑據，它們會被打包進瀏覽器程式碼。
- 公開前執行 `npm run pack:public`，它會按白名單匯出並掃描憑據和個人路徑。掃描是輔助手段，不能替代人工檢查。
- 如果憑據意外洩露，請立刻在服務商處吊銷或輪換。

## 報告問題 / Reporting

發現安全問題請通過 GitHub 私密漏洞報告（Security → Report a vulnerability）聯絡維護者，不要公開貼出細節。
