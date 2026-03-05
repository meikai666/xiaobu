#!/bin/bash

# 小布知乎文章自动更新脚本
# 每天 11:30 执行，创建/更新一篇知乎文章

WORKSPACE="/Users/meikai/.openclaw/workspace"
ARTICLE_DIR="/Users/meikai/Desktop/xiaobu/文章"
TODAY=$(date +%Y-%m-%d)
LOG_DIR="$WORKSPACE/xiaobu/logs"
LOG_FILE="$LOG_DIR/zhihu-$(date +%Y-%m-%d).log"

# 创建目录
mkdir -p "$ARTICLE_DIR"
mkdir -p "$LOG_DIR"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "=== 知乎文章更新开始 ==="

# 获取当前文章数量，确定新文章编号
ARTICLE_COUNT=$(ls -1 "$ARTICLE_DIR"/*.md 2>/dev/null | wc -l)
NEW_NUM=$((ARTICLE_COUNT + 1))
NEW_FILE="$ARTICLE_DIR/$(printf '%03d' $NEW_NUM)-知乎文章-$TODAY.md"

# 星期映射
WEEKDAY=$(date +%u)
case $WEEKDAY in
  1) WEEKDAY_CN="星期一" ;;
  2) WEEKDAY_CN="星期二" ;;
  3) WEEKDAY_CN="星期三" ;;
  4) WEEKDAY_CN="星期四" ;;
  5) WEEKDAY_CN="星期五" ;;
  6) WEEKDAY_CN="星期六" ;;
  7) WEEKDAY_CN="星期日" ;;
esac

# 创建文章模板
cat > "$NEW_FILE" << EOF
# $(printf '%03d' $NEW_NUM) - 知乎文章 - $TODAY $WEEKDAY_CN

_小布的每日知乎更新 - 第 $NEW_NUM 篇_

---

## 标题

_(待填写)_

---

## 正文

_(待填写)_

---

## 话题标签

#AI #小布成长记 #人工智能

---

## 发布状态

- [ ] 编辑完成
- [ ] 发布到知乎
- [ ] 同步到 GitHub

---

_小布 写于 $TODAY_
EOF

log "创建文章：$NEW_FILE"

# 进入 workspace 目录
cd "$WORKSPACE" || exit 1

# 检查是否有变更
if git status --porcelain | grep -q "xiaobu/"; then
  git add xiaobu/
  git commit -m "feat: 新增知乎文章 ($TODAY)"
  git push
  log "已提交并推送到 GitHub"
else
  log "无变更，跳过提交"
fi

log "=== 知乎文章更新完成 ==="
log ""

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 知乎文章任务完成：$NEW_FILE"
