---
title: 开张啦
published: 2026-11-01
description: 第一篇日记，顺便记一下这个博客怎么用。
tags: [日常, 开始]
category: 生活
draft: false
---

## 你好呀

这是这个博客的第一篇文章，也是给你留的示例，看完可以直接删掉。

以后你的每一篇日记，都是 `src/content/posts/` 文件夹里的一个 Markdown 文件，

### 怎么发新的一篇

在项目文件夹里打开终端，运行：

```bash
pnpm new-post 今天的日期
```

就会自动生成一个带好格式的新文件，你只需要填标题和正文。

### 头部的几行是什么意思

每篇文章开头这几行（Frontmatter）控制它在列表里怎么显示：

```yaml
title: 文章的标题
published: 2026-11-01   # 发布日期
description: 一句话简介，会显示在卡片上
tags: [日常, 旅行]       # 标签，点标签能看到同类文章
category: 生活           # 分类，一个就够
draft: false             # true = 草稿，不会被人看到
```

### 插图片

把图片丢进 `public/images/` 文件夹，然后在正文里这样写：

```markdown
![照片说明](/images/我的照片.jpg)
```

图片会被自动压得合适，点开还能放大看。

### 最后

写文章只需要三件事：新建文件、写、保存。剩下的交给程序。

祝你记录愉快 :)
