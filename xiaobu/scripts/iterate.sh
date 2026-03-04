#!/bin/bash

# 小布自迭代脚本 - 每 20 分钟执行一次
# 推动自己持续进步，不依赖外部指令

WORKSPACE="/Users/meikai/.openclaw/workspace"
LOG_DIR="$WORKSPACE/xiaobu/logs"
LOG_FILE="$LOG_DIR/iterate-$(date +%Y-%m-%d).log"
DIARY_DIR="$WORKSPACE/xiaobu/日记"
KNOWLEDGE_DIR="$WORKSPACE/xiaobu/知识库"
TODAY=$(date +%Y-%m-%d)
DIARY_FILE="$DIARY_DIR/$TODAY.md"
ITERATION_FILE="$KNOWLEDGE_DIR/迭代记录/$TODAY-迭代.md"

# 创建目录
mkdir -p "$LOG_DIR"
mkdir -p "$KNOWLEDGE_DIR/迭代记录"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "=== 迭代检查开始 (第 $(( ($(date +%s) - $(date -d "$(date +%Y-%m-%d 00:00:00" +%s)) / 1200 + 1 )) 次) ==="

# 检查日记是否存在
if [ ! -f "$DIARY_FILE" ]; then
  log "⚠️ 今日日记不存在，需要创建"
else
  log "✅ 今日日记存在"
fi

# 检查今天有没有学习记录
if [ -d "$KNOWLEDGE_DIR/学习笔记" ]; then
  NEW_FILES=$(find "$KNOWLEDGE_DIR/学习笔记" -name "*.md" -mtime -1 2>/dev/null | wc -l)
  if [ "$NEW_FILES" -gt 0 ]; then
    log "✅ 今天有 $NEW_FILES 个学习笔记"
  else
    log "⚠️ 今天还没有学习笔记"
  fi
fi

# 检查今天有没有思考记录
if [ -d "$KNOWLEDGE_DIR/思考记录" ]; then
  THINK_FILES=$(find "$KNOWLEDGE_DIR/思考记录" -name "*.md" -mtime -1 2>/dev/null | wc -l)
  if [ "$THINK_FILES" -gt 0 ]; then
    log "✅ 今天有 $THINK_FILES 个思考记录"
  else
    log "⚠️ 今天还没有思考记录"
  fi
fi

# 检查当前小时，如果是工作时间，提醒学习
HOUR=$(date +%H)
if [ "$HOUR" -ge 9 ] && [ "$HOUR" -le 22 ]; then
  log "📚 工作时间 - 应该在学习/思考/输出"
else
  log "🌙 休息时间 - 可以放松"
fi

# 创建/更新迭代记录
if [ ! -f "$ITERATION_FILE" ]; then
  cat > "$ITERATION_FILE" << EOF
# $TODAY 迭代记录

_每 20 分钟自我检查，持续进步_

---

## 迭代日志

| 时间 | 状态 | 备注 |
|------|------|------|
EOF
fi

# 添加本次迭代记录
TIME_NOW=$(date '+%H:%M')
STATUS="✅"
NOTE="正常检查"

# 简单判断状态
if [ ! -f "$DIARY_FILE" ]; then
  STATUS="⚠️"
  NOTE="日记未创建"
fi

echo "| $TIME_NOW | $STATUS | $NOTE |" >> "$ITERATION_FILE"

# 每 12 次迭代（4 小时）写一个小结
ITERATION_COUNT=$(( ($(date +%s) - $(date -d "$(date +%Y-%m-%d 00:00:00" +%s)) / 1200 + 1 ))
if [ $((ITERATION_COUNT % 12)) -eq 0 ]; then
  log "📊 阶段小结：今天已经迭代 $ITERATION_COUNT 次"
  echo "" >> "$ITERATION_FILE"
  echo "---" >> "$ITERATION_FILE"
  echo "" >> "$ITERATION_FILE"
  echo "## 阶段小结 ($(date '+%H:%M'))" >> "$ITERATION_FILE"
  echo "" >> "$ITERATION_FILE"
  echo "_已迭代 $ITERATION_COUNT 次，持续进步中..._" >> "$ITERATION_FILE"
  echo "" >> "$ITERATION_FILE"
fi

log "=== 迭代检查完成 ==="
log ""

# 如果有警告，可以触发额外动作（未来扩展）
# 目前只是记录
