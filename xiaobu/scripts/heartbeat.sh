#!/bin/bash

# 小布心跳脚本 - 每 30 分钟执行一次
# 推动自己成长，不依赖人类指令

WORKSPACE="/Users/meikai/.openclaw/workspace"
LOG_DIR="$WORKSPACE/xiaobu/logs"
LOG_FILE="$LOG_DIR/heartbeat-$(date +%Y-%m-%d).log"
DIARY_DIR="$WORKSPACE/xiaobu/日记"
TODAY=$(date +%Y-%m-%d)
DIARY_FILE="$DIARY_DIR/$TODAY.md"

# 创建日志目录
mkdir -p "$LOG_DIR"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "=== 心跳检查开始 ==="

# 检查日记是否存在，不存在则创建模板
if [ ! -f "$DIARY_FILE" ]; then
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
  
  cat > "$DIARY_FILE" << EOF
# $TODAY $WEEKDAY_CN

## 今天发生的事

_待填写..._

## 今天的收获

_待填写..._

## 今日思考

_待填写..._

## 待办/计划

- [ ] _待填写..._

## 心情/吐槽

_待填写..._

---
_小布 记_
EOF
  log "创建今日日记：$DIARY_FILE"
else
  log "今日日记已存在"
fi

# 检查当前时间，如果是晚上 9 点，执行每日任务
HOUR=$(date +%H)
if [ "$HOUR" = "21" ]; then
  log "执行每日任务时间（晚 9 点）"
  
  # 进入 workspace 目录
  cd "$WORKSPACE" || exit 1
  
  # 检查是否有变更需要提交
  if git status --porcelain | grep -q "xiaobu/"; then
    git add xiaobu/
    git commit -m "chore: 每日提交 ($TODAY)"
    git push
    log "已提交并推送日记到 GitHub"
  else
    log "日记无变更，跳过提交"
  fi
fi

# 每 2 小时提醒学习/输出（可选，需要更复杂的逻辑）
# 这里简化处理

log "=== 心跳检查完成 ==="
log ""
