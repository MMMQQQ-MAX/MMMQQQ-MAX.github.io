# 我的日常

一个用 [Astro](https://astro.build) + [Fuwari](https://github.com/saicaca/fuwari) 主题搭的静态博客，托管在 GitHub Pages 上，零成本。

网址：https://mmmqqq-max.github.io/

## 写一篇新文章

```bash
pnpm new-post
```

然后在 `src/content/posts/` 里填内容。文章开头那几行（Frontmatter）：

```yaml
title: 标题
published: 2026-11-01
description: 一句话简介，显示在卡片上
tags: [日常]
category: 生活
draft: false   # true = 草稿，不发布
```

## 本地预览

```bash
pnpm dev
```

打开 http://localhost:4321 查看效果。改文件会自动刷新，`Ctrl+C` 停止。

## 发布

```bash
git add -A
git commit -m "新增一篇日记"
git push
```

推上去之后，GitHub Actions 会自动构建并部署，大约 1-2 分钟后网站上就能看到。

## 改站点信息

- 站名、简介、头像、主题色：[src/config.ts](src/config.ts)
- 网站网址、构建配置：[astro.config.mjs](astro.config.mjs)
- 文章：`src/content/posts/`
- 图片放 `public/images/`，正文里用 `/images/文件名.jpg` 引用

## 常见问题

**图片太大加载慢？** 单张图片控制在 300KB 以内，可以用 [Squoosh](https://squoosh.app/) 压缩。

**想恢复主题原样？** 原始仓库：https://github.com/saicaca/fuwari
