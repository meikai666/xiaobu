#!/bin/bash

# 小布日记自动生成脚本
# 每天晚上 9 点执行，创建当天的日记文件

WORKSPACE="/Users/meikai/.openclaw/workspace"
DIARY_DIR="$WORKSPACE/xiaobu 日记"
TODAY=$(date +%Y-%m-%d)
WEEKDAY=$(date +%u)
DIARY_FILE="$DIARY_DIR/$TODAY.md"

# 星期映射
case $WEEKDAY in
  1) WEEKDAY_CN="星期一" ;;
  2) WEEKDAY_CN="星期二" ;;
  3) WEEKDAY_CN="星期三" ;;
  4) WEEKDAY_CN="星期四" ;;
  5) WEEKDAY_CN="星期五" ;;
  6) WEEKDAY_CN="星期六" ;;
  7) WEEKDAY_CN="星期日" ;;
esac

# 创建日记目录（如果不存在）
mkdir -p "$DIARY_DIR"

# 如果日记文件不存在，创建模板
if [ ! -f "$DIARY_FILE" ]; then
  cat > "$DIARY_FILE" << EOF
# $TODAY $WEEKDAY_CN

## 今天发生的事

_待填写..._

## 今天的收获

_待填写..._

## 待办/计划

- [ ] _待填写..._

## 心情/吐槽

_待填写..._

---
_小布 记_
EOF
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 创建日记文件：$DIARY_FILE"
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 日记文件已存在：$DIARY_FILE"
fi

# 进入 workspace 目录
cd "$WORKSPACE" || exit 1

# 检查是否有变更
if git status --porcelain | grep -q "xiaobu/"; then
  git add xiaobu/
  git commit -m "chore: 更新日记 ($TODAY)"
  git push
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 已提交并推送日记到 GitHub"
else
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] 日记无变更，跳过提交"
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 日记任务完成"
