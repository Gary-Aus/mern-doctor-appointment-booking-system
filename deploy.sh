#!/bin/bash

# 医生预约系统自动部署脚本
echo "🚀 开始部署医生预约系统..."

# 检查是否在正确的目录
if [ ! -f "package.json" ] && [ ! -d "backend" ] && [ ! -d "frontend" ] && [ ! -d "admin-portal" ]; then
    echo "❌ 错误：请在项目根目录运行此脚本"
    exit 1
fi

# 设置颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}📋 部署检查清单:${NC}"
echo "1. ✅ 前端应用 (Vercel)"
echo "2. ✅ 管理端应用 (Vercel)" 
echo "3. ✅ 后端 API (Render)"
echo ""

# 检查 Git 状态
echo -e "${YELLOW}🔍 检查 Git 状态...${NC}"
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${YELLOW}⚠️  发现未提交的更改，正在提交...${NC}"
    git add .
    git commit -m "chore: 自动部署配置更新"
    echo -e "${GREEN}✅ 更改已提交${NC}"
else
    echo -e "${GREEN}✅ Git 工作区干净${NC}"
fi

# 推送到远程仓库
echo -e "${YELLOW}📤 推送到远程仓库...${NC}"
git push origin master

echo ""
echo -e "${GREEN}🎉 部署配置完成！${NC}"
echo ""
echo -e "${BLUE}📝 下一步操作:${NC}"
echo "1. 将代码推送到 GitHub 仓库"
echo "2. 在 Vercel 中连接 GitHub 仓库并部署前端和管理端"
echo "3. 在 Render 中连接 GitHub 仓库并部署后端"
echo "4. 配置环境变量"
echo ""
echo -e "${BLUE}🔗 部署链接:${NC}"
echo "前端: https://your-frontend.vercel.app"
echo "管理端: https://your-admin.vercel.app" 
echo "后端: https://your-backend.onrender.com"
echo ""
echo -e "${YELLOW}💡 提示: 请确保在部署平台配置正确的环境变量${NC}"
