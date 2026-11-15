# 內容生成流程 / Content pipeline

所有指令碼在 `scripts/atlas/`，憑據只從環境變數或倉庫外目錄讀取（見 [SECURITY.md](../SECURITY.md)）。中間產物寫入被 Git 忽略的 `.local/forge/`，可斷點續跑。

1. **詞頭**：`.local/forge/headwords.json`，每項 `{hid, word, raw}`。`raw` 是可選的義項提示，只用於判斷哪些義項重要，不會被複制進輸出。
2. **詞條文本** `gen_text.py`：每批 10 個詞，按 [`gen_text.py`](../scripts/atlas/gen_text.py) 中的編寫規範（準確優先、原創、兩類例句、不編造詞源、安全中立）生成 JSON。
3. **插畫** `gen_images.py`：每個詞條自帶一個場景描述 `scene`，與統一畫風提示詞組合後生成 1024px 圖片，壓縮為 768px WebP 母版。按學習路線順序生成。
4. **發音** `gen_word_audio.py`：ElevenLabs，英音 Alice、美音 Sarah。
5. **例句朗讀** `gen_sentence_audio.py`：為 `ex[0]` 合成朗讀，按學習路線順序。
6. **編譯** `build_atlas.py`：清洗欄位、排序、切塊，生成 `public/atlas/` 與 `data/`。
7. **校驗** `npm run check:atlas`：結構、順序、引用與媒體檔案存在性。

```bash
export SUB2_BASE_URL=... SUB2_API_KEY=... ELEVENLABS_API_KEY=...
python3 scripts/atlas/gen_text.py --workers 8
python3 scripts/atlas/gen_images.py --workers 8 --follow
python3 scripts/atlas/gen_word_audio.py
python3 scripts/atlas/gen_sentence_audio.py --follow
python3 scripts/atlas/build_atlas.py
npm run check:atlas
```

`SUB2_BASE_URL` 指向任意 OpenAI 相容的介面。

## 質量邊界

自動校驗覆蓋結構、欄位、順序和檔案，不覆蓋語義正確性。插畫和例句沒有逐條人工審校；發現問題請提 Issue 或 PR。
