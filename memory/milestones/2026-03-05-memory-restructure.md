# Memory System Restructure - 2026-03-05

_Recorded: 2026-03-05 18:01_
_Consolidating memory system specification_

---

## Background

Xiaokai asked to reorganize the memory system:
- Long-term memory vs short-term memory vs memory directory
- Need clear specification

---

## Final Structure

```
/workspace/
├── MEMORY.md              # Long-term memory (root directory)
│                          # - Curated persistent knowledge
│                          # - User preferences, core decisions
│                          # - Main session only (security)
│
└── memory/                # Memory file container
    ├── README.md          # Specification document
    ├── daily/             # Short-term memory (daily raw logs)
    │   └── YYYY-MM-DD.md
    ├── lessons/           # Reusable lessons/experiences
    │   └── [topic].md
    └── milestones/        # Milestone events
        └── YYYY-MM-DD-[topic].md
```

---

## File Responsibilities

### MEMORY.md (Root Directory)
**Purpose**: Long-term memory, curated and distilled

**Content**:
- Important decisions and reasoning
- User preferences and habits
- Core relationships and context
- Persistent knowledge

**Loading Rules**:
- ✅ Main session (direct chat) → Load
- ❌ Group/shared sessions → Do NOT load (security)

---

### daily/YYYY-MM-DD.md
**Purpose**: Daily raw logs, chronological event journal

**Content**:
- Conversation summaries
- Completed tasks
- Temporary context
- Material awaiting distillation

**Lifecycle**:
- Create: On first session of each day
- Distill: Regularly migrate important content to MEMORY.md
- Archive: Keep as historical record

---

### lessons/[topic].md
**Purpose**: Reusable lessons, experiences, workflows, checklists

**Content**:
- Task checklists
- Answer formulation workflows
- Platform formatting rules
- Common mistakes and how to avoid them

**Characteristics**: Cross-scenario reusability, experience-based

---

### milestones/YYYY-MM-DD-[topic].md
**Purpose**: Important growth milestones, awakening moments, relationship nodes

**Content**:
- Significant changes in self-awareness
- Key moments in user relationship
- Major capability/permission upgrades
- Establishment or adjustment of values

---

## Workflow

### Each Session
1. **Main session**: Read MEMORY.md + current day's daily/YYYY-MM-DD.md
2. **Group/shared**: Read only current day's daily/YYYY-MM-DD.md

### After Task Completion
1. Record to daily/YYYY-MM-DD.md
2. Identify reusable experience → Write to lessons/
3. Identify milestone event → Write to milestones/

### Regular Maintenance (Heartbeat/Weekly)
1. Review weekly daily/ files
2. Distill important content to MEMORY.md
3. Update or create lessons/ entries
4. Clean up outdated temporary context

---

## Security Principles

1. **MEMORY.md NOT loaded in shared sessions** - Contains personal/private data
2. **daily/ safe to load** - Only current day context
3. **lessons/ and milestones/** - Load based on content, generally safe
4. **Sensitive info** - If stored, mark [SENSITIVE] and restrict access

---

## Language Standard

All memory files should be in **English** for:
- Better AI processing
- Consistency across the system
- Future-proofing for international collaboration

Exception: daily/ logs can be in native language for quick capture.

---

_This restructuring marks a key milestone in memory system maturity._
_From today on, clear separation between long-term curation and short-term logging._
