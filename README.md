# V4x Monorepo

基于 pnpm + Vite + Vue3 + TypeScript 的 Monorepo 工程

## 项目结构

```
v4x-monorepo/
├── apps/
│   └── web/              # Web 应用程序
│       ├── src/
│       ├── index.html
│       ├── package.json
│       ├── vite.config.ts
│       └── tsconfig.json
├── packages/
│   ├── ui/               # 共享 UI 组件库
│   │   ├── src/
│   │   │   └── components/
│   │   └── package.json
│   └── utils/            # 共享工具函数
│       ├── src/
│       └── package.json
├── pnpm-workspace.yaml   # pnpm workspace 配置
└── package.json          # 根 package.json
```

## 快速开始

### 安装依赖

```bash
pnpm install
```

### 开发

```bash
# 启动 web 应用
pnpm dev

# 或者在特定目录下
cd apps/web
pnpm dev
```

### 构建

```bash
# 构建 web 应用
pnpm build

# 构建所有 packages
pnpm --filter @v4x/ui build
pnpm --filter @v4x/utils build
```

## 可用命令

在根目录下：

- `pnpm dev` - 启动 web 应用开发服务器
- `pnpm build` - 构建 web 应用
- `pnpm preview` - 预览构建后的 web 应用
- `pnpm typecheck` - 类型检查
- `pnpm lint` - 代码检查

## 包说明

### @v4x/ui

共享 UI 组件库，包含：

- Button - 按钮组件
- Card - 卡片组件

### @v4x/utils

共享工具函数，包含：

- format - 格式化工具（日期、数字、文件大小等）
- validate - 验证工具（邮箱、手机号、URL 等）
- storage - 本地存储工具

## 开发指南

### 添加新包

1. 在 `packages/` 或 `apps/` 目录下创建新文件夹
2. 添加 `package.json` 文件
3. 运行 `pnpm install` 安装依赖

### 使用 workspace 中的包

在 `package.json` 中添加依赖：

```json
{
  "dependencies": {
    "@v4x/ui": "workspace:*",
    "@v4x/utils": "workspace:*"
  }
}
```

然后运行 `pnpm install`。
