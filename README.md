# 纸间集 · 小叮当的艺术作品集

一个纯静态的儿童艺术作品集网页：**一屏一件作品**，桌面上下滚动 / 手机左右滑动翻页，
点作品看大图，右上「概览」可按分类（爱秀 / 学校 / 日常）筛选。

## 目录

```
index.html        入口页（作品集本体，单文件 + img/ 图片）
zhijianji.html    同一份内容的英文名副本（中文文件名在个别环境不方便时用）
img/              全部图片（作品图、概览缩略图、创作过程图）
.nojekyll         告诉 Pages 不要用 Jekyll 处理，直接当静态文件发
```

内容全部写在 HTML 里、图片是独立文件，所以**即使浏览器不执行 JavaScript，作品也能正常看到**
（会退化成"向下滚动看完全部作品"的普通网页）。

## 部署

### Gitee Pages（注意：该服务目前已停止提供）
Gitee 官方在 2025 年已下架 Pages 服务，仓库里的「服务 → Gitee Pages」入口不再存在
（参考 [Gitee 官方 issue](https://gitee.com/oschina/git-osc/issues/I9LOM3)）。仓库仍然可以作为
代码托管，但不建议再指望它出网页。

### 可选替代（都支持这个纯静态目录，零改动）

| 方案 | 做法 |
|---|---|
| GitHub Pages | 推到 GitHub 仓库 → Settings → Pages → Source 选 `main` / `(root)` |
| Vercel | 导入仓库，Framework 选 **Other**，直接 Deploy |
| Netlify | 拖拽 `deploy/` 目录到 Netlify Drop，或连接仓库、Build 命令留空 |
| Cloudflare Pages | 连接仓库，Build command 留空，Output directory 填 `/` |
| 任意虚拟主机 / 对象存储 | 整个目录上传即可，入口是 `index.html` |

## 本地更新

```bash
python ../build_static.py     # 重新生成 index.html 与 img/
```

作品数据在 `build_static.py` 顶部的 `WORKS` 列表里：每件作品填 `title / cat / date / art / crop / process`，
分类只能是 `爱秀 / 学校 / 日常`，脚本会按日期自动倒序排列。
