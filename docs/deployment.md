# 部署 / Deployment

`npm run build` 會產生純靜態網站 `dist/`，可部署至 Nginx、Cloudflare Pages、Vercel 或 GitHub Pages。

## 子路徑

GitHub Pages 專案網站使用 `/word-atlas/` 子路徑，建置時請設定：

```bash
ATLAS_BASE=/word-atlas/ npm run build
```

## Nginx 範例

```nginx
location ^~ /word-atlas/ {
    alias /var/www/word-atlas/;
    try_files $uri $uri/ /word-atlas/index.html;
    expires 7d;
}
```

## GitHub Pages

`.github/workflows/pages.yml` 會在變更合併至 `main` 後自動建置並部署。首次部署前，請前往儲存庫 Settings → Pages，將部署來源設為 “GitHub Actions”。也可以在 Actions 頁面手動執行 “Deploy to GitHub Pages”。

網站網址為 [https://zeroasuka.github.io/word-atlas/](https://zeroasuka.github.io/word-atlas/)。

## 檔案大小

插畫與音訊合計約數百 MB。建議透過 CDN 部署，或依需求只發布 `thumb/` 和部分音訊。
