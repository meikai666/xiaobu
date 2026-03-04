#!/bin/bash
# 小布的自动备份脚本

WORKSPACE="/Users/meikai/.openclaw/workspace"
cd "$WORKSPACE" || exit 1

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] 无变更，跳过备份"
    exit 0
fi

# 添加并提交
git add .
git commit -m "📊 自动备份 - $(date '+%Y-%m-%d %H:%M:%S')"

# 推送到 GitHub
git push origin main

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 备份完成"
