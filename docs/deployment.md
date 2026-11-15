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

## Docker／FNOS

此專案提供多階段 Dockerfile 與 Docker Compose 設定。需要 Docker Engine 及 Compose v2；預設以容器連接埠 `8080` 提供網站，主機連接埠為 `8088`。

```bash
docker compose up -d --build
```

開啟 `http://<NAS 位址>:8088/`。若 `8088` 已被使用，可在啟動前設定 `WORD_ATLAS_PORT`，例如 `WORD_ATLAS_PORT=8090 docker compose up -d --build`。更新程式碼後再次執行建置命令即可更新映像；停止服務請執行 `docker compose down`。

FNOS 可將儲存庫放在 `/vol1/docker/word-atlas`，再於該目錄執行上述命令。容器以非 root 使用者執行，並採用唯讀根檔案系統。

## 檔案大小

插畫與音訊合計約數百 MB。建議透過 CDN 部署，或依需求只發布 `thumb/` 和部分音訊。
