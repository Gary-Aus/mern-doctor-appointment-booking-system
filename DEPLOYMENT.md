# 🚀 医生预约系统自动部署指南

## 📋 部署架构

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   前端应用       │    │   管理端应用     │    │   后端 API      │
│   (Vercel)      │    │   (Vercel)      │    │   (Render)      │
│                 │    │                 │    │                 │
│  React + Vite   │    │  React + Vite   │    │  Node.js +      │
│  Tailwind CSS   │    │  Tailwind CSS   │    │  Express.js     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   MongoDB       │
                    │   Atlas        │
                    └─────────────────┘
```

## 🛠️ 部署步骤

### 1. 准备工作

#### 1.1 创建必要的账户
- [ ] GitHub 账户
- [ ] Vercel 账户 (vercel.com)
- [ ] Render 账户 (render.com)
- [ ] MongoDB Atlas 账户
- [ ] Cloudinary 账户

#### 1.2 配置环境变量
复制 `env.example` 文件并重命名为 `.env`，填入实际值：

```bash
cp env.example .env
```

### 2. 后端部署 (Render)

#### 2.1 在 Render 中创建 Web Service
1. 登录 [Render](https://render.com)
2. 点击 "New +" → "Web Service"
3. 连接你的 GitHub 仓库
4. 选择 `backend` 目录作为根目录
5. 配置以下设置：
   - **Build Command**: `npm install`
   - **Start Command**: `npm start`
   - **Environment**: `Node`

#### 2.2 配置环境变量
在 Render 的 Environment Variables 中添加：

```
NODE_ENV=production
PORT=10000
MONGODB_URI=your-mongodb-connection-string
JWT_SECRET=your-jwt-secret
CLOUDINARY_NAME=your-cloudinary-name
CLOUDINARY_API_KEY=your-cloudinary-api-key
CLOUDINARY_API_SECRET=your-cloudinary-api-secret
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=your-admin-password
```

#### 2.3 部署
- 点击 "Create Web Service"
- Render 会自动构建和部署你的后端

### 3. 前端部署 (Vercel)

#### 3.1 部署用户端
1. 登录 [Vercel](https://vercel.com)
2. 点击 "New Project"
3. 导入 GitHub 仓库
4. 选择 `frontend` 目录
5. 配置环境变量：
   ```
   VITE_BACKEND_URL=https://your-backend.onrender.com
   ```
6. 点击 "Deploy"

#### 3.2 部署管理端
1. 在 Vercel 中创建新项目
2. 选择 `admin-portal` 目录
3. 配置环境变量：
   ```
   VITE_BACKEND_URL=https://your-backend.onrender.com
   ```
4. 点击 "Deploy"

### 4. 自动部署配置

#### 4.1 GitHub Actions
项目已配置 GitHub Actions 自动部署：
- 推送到 `master` 或 `main` 分支时自动触发
- 自动构建前端和管理端
- 自动部署到 Vercel

#### 4.2 配置 GitHub Secrets
在 GitHub 仓库设置中添加以下 Secrets：

```
VERCEL_TOKEN=your-vercel-token
VERCEL_ORG_ID=your-vercel-org-id
VERCEL_PROJECT_ID=your-frontend-project-id
VERCEL_ADMIN_PROJECT_ID=your-admin-project-id
```

### 5. 本地开发

#### 5.1 启动后端
```bash
cd backend
npm install
npm run server
```

#### 5.2 启动前端
```bash
cd frontend
npm install
npm run dev
```

#### 5.3 启动管理端
```bash
cd admin-portal
npm install
npm run dev
```

## 🔧 部署脚本

### 使用自动部署脚本
```bash
# 运行部署脚本
./deploy.sh
```

### 手动部署步骤
```bash
# 1. 提交更改
git add .
git commit -m "feat: 新功能更新"
git push origin master

# 2. 部署会自动触发
# - GitHub Actions 会构建项目
# - Vercel 会自动部署前端和管理端
# - Render 会自动部署后端
```

## 📊 部署检查清单

### 后端部署检查
- [ ] Render 服务正常运行
- [ ] 环境变量配置正确
- [ ] MongoDB 连接成功
- [ ] Cloudinary 配置正确
- [ ] API 端点可访问

### 前端部署检查
- [ ] Vercel 部署成功
- [ ] 环境变量配置正确
- [ ] 后端 API 连接正常
- [ ] 用户界面正常显示
- [ ] 路由功能正常

### 管理端部署检查
- [ ] Vercel 部署成功
- [ ] 环境变量配置正确
- [ ] 后端 API 连接正常
- [ ] 管理员登录功能正常
- [ ] 医生管理功能正常

## 🚨 常见问题

### 1. 构建失败
- 检查 Node.js 版本兼容性
- 确保所有依赖正确安装
- 检查环境变量配置

### 2. 部署失败
- 检查 GitHub Actions 日志
- 验证 Vercel/Render 配置
- 确认环境变量设置

### 3. 运行时错误
- 检查后端 API 连接
- 验证数据库连接
- 确认 Cloudinary 配置

## 📈 监控和维护

### 1. 性能监控
- Vercel Analytics
- Render Metrics
- MongoDB Atlas Monitoring

### 2. 日志查看
- Render 日志面板
- Vercel 函数日志
- GitHub Actions 日志

### 3. 定期维护
- 依赖更新
- 安全补丁
- 性能优化

## 🔗 部署链接

部署完成后，您将获得以下链接：

- **前端应用**: `https://your-frontend.vercel.app`
- **管理端应用**: `https://your-admin.vercel.app`
- **后端 API**: `https://your-backend.onrender.com`

## 📞 支持

如果遇到部署问题，请检查：
1. GitHub Actions 日志
2. Vercel 部署日志
3. Render 服务日志
4. 环境变量配置

---

**部署完成后，记得更新前端和管理端的环境变量中的后端 URL！**
