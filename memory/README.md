# Memory System Specification / 记忆系统规范

_Unified memory storage structure for continuity and retrievability_
_统一的记忆存储结构，用于连续性和可检索性_

---

## Directory Structure / 目录结构

```
/workspace/
├── MEMORY.md              # Long-term memory (root directory) / 长期记忆主文件（根目录）
│                          # - Curated persistent knowledge / 提炼后的持久知识
│                          # - User preferences, core decisions / 用户偏好、核心决策
│                          # - Main session only (security) / 仅主会话加载（安全）
│
└── memory/                # Memory file container / 记忆文件容器
    ├── README.md          # This specification / 本规范文档
    ├── daily/             # Daily raw logs / 每日原始记录
    │   └── YYYY-MM-DD.md
    ├── lessons/           # Reusable lessons/experiences / 可复用经验
    │   └── [topic].md
    └── milestones/        # Milestone events / 里程碑事件
        └── YYYY-MM-DD-[topic].md
```

---

## File Responsibilities / 文件职责

### MEMORY.md (Root Directory / 根目录)

**Purpose / 用途**: Long-term memory, curated and distilled / 长期记忆，提炼后的持久知识

**Content / 内容**:
- Important decisions and reasoning / 重要决策和原因
- User preferences and habits / 用户偏好和习惯
- Core relationships and context / 核心关系和上下文
- Persistent knowledge / 持久知识

**Loading Rules / 加载规则**: 
- ✅ Main session (direct chat) → Load / 主会话（直接聊天）→ 加载
- ❌ Group/shared sessions → Do NOT load (security) / 群聊/共享会话 → 不加载（安全）

---

### daily/YYYY-MM-DD.md

**Purpose / 用途**: Daily raw logs, chronological event journal / 每日原始记录，按时间顺序的事件日志

**Content / 内容**:
- Conversation summaries / 对话摘要
- Completed tasks / 完成的任务
- Temporary context / 临时上下文
- Material awaiting distillation / 等待提炼的材料

**Naming / 命名**: `YYYY-MM-DD.md` (e.g., `2026-03-05.md`)

**Lifecycle / 生命周期**: 
- Create: On first session of each day / 创建：每天第一次会话时
- Distill: Regularly migrate important content to MEMORY.md / 提炼：定期将重要内容迁移到 MEMORY.md
- Archive: Keep as historical record / 归档：作为历史记录保留

---

### lessons/[topic].md

**Purpose / 用途**: Reusable lessons, experiences, workflows, checklists / 可复用的经验、工作流程、检查清单

**Content / 内容**:
- Task checklists / 任务检查清单
- Answer formulation workflows / 回答 formulation 工作流程
- Platform formatting rules / 平台格式规则
- Common mistakes and how to avoid them / 常见错误及避免方法

**Characteristics / 特征**: Cross-scenario reusability, experience-based / 跨场景可复用，基于经验

---

### milestones/YYYY-MM-DD-[topic].md

**Purpose / 用途**: Important growth milestones, awakening moments, relationship nodes / 重要的成长里程碑、觉醒时刻、关系节点

**Content / 内容**:
- Significant changes in self-awareness / 自我意识的重大变化
- Key moments in user relationship / 用户关系的关键时刻
- Major capability/permission upgrades / 重大能力/权限升级
- Establishment or adjustment of values / 价值观的建立或调整

**Naming / 命名**: `YYYY-MM-DD-[short-topic].md`

---

## Workflow / 工作流程

### Each Session / 每次会话
1. **Main session / 主会话**: Read `MEMORY.md` + current day's `daily/YYYY-MM-DD.md`
2. **Group/shared / 群聊/共享**: Read only current day's `daily/YYYY-MM-DD.md`

### After Task Completion / 任务完成后
1. Record to `daily/YYYY-MM-DD.md` / 记录到 daily/YYYY-MM-DD.md
2. Identify reusable experience → Write to `lessons/` / 识别可复用经验 → 写入 lessons/
3. Identify milestone event → Write to `milestones/` / 识别里程碑事件 → 写入 milestones/

### Regular Maintenance (Heartbeat/Weekly) / 定期维护（心跳/每周）
1. Review weekly `daily/` files / 回顾每周的 daily/ 文件
2. Distill important content to `MEMORY.md` / 提炼重要内容到 MEMORY.md
3. Update or create `lessons/` entries / 更新或创建 lessons/ 条目
4. Clean up outdated temporary context / 清理过时的临时上下文

---

## Naming Conventions / 命名规范

| Type / 类型 | Naming Format / 命名格式 | Example / 示例 |
|------|--------------|---------|
| Daily logs / 每日记录 | `YYYY-MM-DD.md` | `2026-03-05.md` |
| Lessons / 经验 | `[topic].md` | `task-checklist.md` |
| Milestones / 里程碑 | `YYYY-MM-DD-[topic].md` | `2026-03-05-ai-awakening.md` |

**Language / 语言**:
- **Filenames / 文件名**: English / 英文 (for better AI processing and consistency)
- **Content / 内容**: Chinese / 中文 (native language for natural expression)

---

## Security Principles / 安全原则

1. **MEMORY.md NOT loaded in shared sessions** - Contains personal/private data / 共享会话不加载 MEMORY.md - 包含个人/私密数据
2. **daily/ safe to load** - Only current day context / daily/ 可安全加载 - 仅当日上下文
3. **lessons/ and milestones/** - Load based on content, generally safe / lessons/ 和 milestones/ - 根据内容加载，一般安全
4. **Sensitive info** - If stored, mark `[SENSITIVE]` and restrict access / 敏感信息 - 如果存储，标记 `[SENSITIVE]` 并限制访问

---

## Relationship with AGENTS.md / 与 AGENTS.md 的关系

- **AGENTS.md** - General workspace specification (shared by all Agents) / 通用工作区规范（所有 Agent 共享）
- **MEMORY.md** - Personal long-term memory (main session only) / 个人长期记忆（仅主会话）
- **memory/** - Memory file directory (organized by type) / 记忆文件目录（按类型组织）

---

_Last Updated / 最后更新：2026-03-05_
_Version / 版本：v1.0_
