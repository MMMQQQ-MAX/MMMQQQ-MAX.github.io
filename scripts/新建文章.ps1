$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
Set-Location $repo
$siteUrl = "https://mmmqqq-max.github.io"

function Pause-Exit {
	param([string]$Message)
	Write-Host ""
	if ($Message) { Write-Host "  $Message" -ForegroundColor Yellow }
	Read-Host "  按回车键关闭" | Out-Null
	exit
}

Write-Host ""
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host "        时光沙漏 · 写一篇新日记" -ForegroundColor Cyan
Write-Host "  ========================================" -ForegroundColor Cyan
Write-Host ""

$title = Read-Host "  文章标题"
if ([string]::IsNullOrWhiteSpace($title)) { Pause-Exit "没有输入标题，已取消。" }
$title = $title.Trim()

$now = Get-Date
$slug = $now.ToString("yyyy-MM-dd-HHmm")
$file = Join-Path $repo "src\content\posts\$slug.md"
if (Test-Path $file) {
	$slug = $now.ToString("yyyy-MM-dd-HHmmss")
	$file = Join-Path $repo "src\content\posts\$slug.md"
}

$frontmatter = @"
---
title: $title
published: $($now.ToString('yyyy-MM-dd'))
description: ''
image: ''
tags: [日常]
category: 生活
draft: false
lang: ''
---

<!-- 在下面写正文，这一行注释可以删掉 -->


"@

[IO.File]::WriteAllText($file, $frontmatter, [Text.UTF8Encoding]::new($false))
Write-Host ""
Write-Host "  已创建文件，正在打开记事本……" -ForegroundColor Green
Write-Host "  写完保存并关闭记事本，就会自动发布。" -ForegroundColor DarkGray
Write-Host ""

if ($env:NO_EDIT -ne "1") {
	Start-Process notepad.exe -ArgumentList "`"$file`"" -Wait
}

$content = Get-Content $file -Raw -Encoding UTF8
$body = ($content -split "---", 3)[-1]
if ([string]::IsNullOrWhiteSpace(($body -replace "<!--.*?-->", ""))) {
	Pause-Exit "正文是空的，这篇文章已保存在本地，但没有发布。"
}

Write-Host ""
$answer = Read-Host "  现在发布到网上吗？(Y/n)"
if ($answer -ne "" -and $answer -notmatch "^[yY]") {
	Write-Host ""
	Write-Host "  好的，没有发布。文件在：src\content\posts\$slug.md" -ForegroundColor Yellow
	Pause-Exit ""
}

Write-Host ""
Write-Host "  正在发布……" -ForegroundColor Cyan
try {
	git add -A 2>&1 | Out-Null
	git commit -m "新增日记：$title" 2>&1 | Out-Null
	$push = git push 2>&1
	if ($LASTEXITCODE -ne 0) { throw $push }
	Write-Host "  发布成功！大约 1 分钟后就能看到：" -ForegroundColor Green
	Write-Host "  $siteUrl/posts/$slug/" -ForegroundColor Green
	Start-Process "$siteUrl/posts/$slug/"
} catch {
	Write-Host "  推送失败（可能是网络问题），文章已保存在本地。" -ForegroundColor Red
	Write-Host "  过一会儿再双击这个脚本，或联系我处理。" -ForegroundColor Red
}

Pause-Exit ""
