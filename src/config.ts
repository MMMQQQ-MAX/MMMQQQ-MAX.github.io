import type {
	ExpressiveCodeConfig,
	LicenseConfig,
	NavBarConfig,
	ProfileConfig,
	SiteConfig,
} from "./types/config";
import { LinkPreset } from "./types/config";

export const siteConfig: SiteConfig = {
	title: "时光沙漏",
	subtitle: "把日子过成可以翻阅的样子",
	lang: "zh_CN", // 语言代码，例如 'en', 'zh_CN', 'ja' 等
	themeColor: {
		hue: 250, // 主题色相，0-360：红 0 / 青 200 / 蓝 250 / 粉 345
		fixed: false, // true = 不给访客显示换色按钮
	},
	banner: {
		enable: false, // 想放一张首页大图就改成 true，并把图片放到 src/assets/images/
		src: "assets/images/demo-banner.png", // 相对 /src 目录；以 / 开头则相对 /public 目录
		position: "center", // 图片裁切位置：'top' | 'center' | 'bottom'
		credit: {
			enable: false, // 显示图片作者署名
			text: "",
			url: "",
		},
	},
	toc: {
		enable: true, // 文章右侧显示目录
		depth: 2, // 目录最多显示到几级标题（1-3）
	},
	favicon: [
		// 留空使用默认图标；换成自己的：把 icon.png 放进 public/favicon/
		// {
		//   src: '/favicon/icon.png',
		//   theme: 'light',
		//   sizes: '32x32',
		// }
	],
};

export const navBarConfig: NavBarConfig = {
	links: [
		LinkPreset.Home,
		LinkPreset.Archive,
		LinkPreset.About,
		{
			name: "GitHub",
			url: "https://github.com/MMMQQQ-MAX",
			external: true,
		},
	],
};

export const profileConfig: ProfileConfig = {
	avatar: "assets/images/demo-avatar.png", // 换成自己的头像：放进 src/assets/images/ 再改这里的文件名
	name: "日常",
	bio: "记录生活里的每一个普通日子。",
	links: [
		// 社交链接示例：
		// {
		// 	name: "GitHub",
		// 	icon: "fa6-brands:github", // 图标去 https://icones.js.org/ 查
		// 	url: "https://github.com/",
		// },
	],
};

export const licenseConfig: LicenseConfig = {
	enable: true,
	name: "CC BY-NC-SA 4.0",
	url: "https://creativecommons.org/licenses/by-nc-sa/4.0/",
};

export const expressiveCodeConfig: ExpressiveCodeConfig = {
	// 注意：部分样式（如背景色）在 astro.config.mjs 中被覆盖，请选择深色主题
	theme: "github-dark",
};
