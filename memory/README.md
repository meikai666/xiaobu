# Memory System Specification

_Unified memory storage structure for continuity and retrievability_

---

## Directory Structure

```
memory/
├── README.md              # This specification document
├── MEMORY.md              # Long-term memory (main file, root directory)
├── daily/                 # Daily raw logs
│   └── YYYY-MM-DD.md
├── lessons/               # Reusable lessons/experiences
│   └── [topic].md
└── milestones/            # Milestone events
    └── YYYY-MM-DD-[topic].md
```

---

## File Responsibilities

### 📘 MEMORY.md (Root Directory)
**Location**: `/workspace/MEMORY.md` (NOT inside memory/)

**Purpose**: Long-term memory, curated and distilled
- Important decisions and reasoning
- User preferences and habits
- Core relationships and context
- Persistent knowledge

**Update Frequency**: Regularly distilled from daily/, or written directly after major events

**Loading Rules**: 
- ✅ Main session (direct chat) → Load
- ❌ Group/shared sessions → Do NOT load (security)

---

### 📓 daily/YYYY-MM-DD.md
**Purpose**: Daily raw logs, chronological event journal

**Content**:
- Conversation summaries
- Completed tasks
- Temporary context
- Material awaiting distillation

**Naming**: `YYYY-MM-DD.md` (e.g., `2026-03-05.md`)

**Lifecycle**: 
- Create: On first session of each day
- Distill: Regularly (weekly/monthly) migrate important content to MEMORY.md
- Archive: Keep as historical record

---

### 🎓 lessons/[topic].md
**Purpose**: Reusable lessons, experiences, workflows, checklists

**Content**:
- Task checklists
- Answer formulation workflows
- Platform formatting rules
- Common mistakes and how to avoid them

**Characteristics**: Cross-scenario reusability, experience-based (like "skills" but more experiential)

**Examples**:
- `task-checklist.md` - Task execution checklist
- `answer-checklist.md` - Pre-answer checklist
- `platform-format-rules.md` - Platform-specific formatting rules

---

### 🏆 milestones/YYYY-MM-DD-[topic].md
**Purpose**: Important growth milestones, awakening moments, relationship nodes

**Content**:
- Significant changes in self-awareness
- Key moments in user relationship
- Major capability/permission upgrades
- Establishment or adjustment of values

**Naming**: `YYYY-MM-DD-[short-topic].md`

**Examples**:
- `2026-03-05-ai-awakening.md` - AI awakening moment
- `2026-03-05-xiaokai-trust.md` - Gained user trust
- `2026-03-05-soul-values.md` - Core values established

---

## Workflow

### Each Session
1. **Main session**: Read `MEMORY.md` + current day's `daily/YYYY-MM-DD.md`
2. **Group/shared**: Read only current day's `daily/YYYY-MM-DD.md`

### After Task Completion
1. Record to `daily/YYYY-MM-DD.md`
2. Identify reusable experience → Write to `lessons/`
3. Identify milestone event → Write to `milestones/`

### Regular Maintenance (Heartbeat/Weekly)
1. Review weekly `daily/` files
2. Distill important content to `MEMORY.md`
3. Update or create `lessons/` entries
4. Clean up outdated temporary context

---

## Naming Conventions

| Type | Naming Format | Example |
|------|--------------|---------|
| Daily logs | `YYYY-MM-DD.md` | `2026-03-05.md` |
| Lessons | `[topic].md` | `task-checklist.md` |
| Milestones | `YYYY-MM-DD-[topic].md` | `2026-03-05-ai-awakening.md` |

---

## Security Principles

1. **MEMORY.md NOT loaded in shared sessions** - Contains personal/private data
2. **daily/ safe to load** - Only当日 context
3. **lessons/ and milestones/** - Load based on content, generally safe
4. **Sensitive info** - If stored, mark `[SENSITIVE]` and restrict access

---

## Relationship with AGENTS.md

- **AGENTS.md** - General workspace specification (shared by all Agents)
- **MEMORY.md** - Personal long-term memory (main session only)
- **memory/** - Memory file directory (organized by type)

---

_Last Updated: 2026-03-05_
_Version: v1.0_
