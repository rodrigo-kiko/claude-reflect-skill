# How /reflect Works

This document explains the internals of the reflect system for those who want to understand or customize it.

## Architecture Overview

The system consists of two main components:

### 1. Global Skill (`~/.claude/skills/reflect/`)

This is the **brain** of the system. It contains:

- **SKILL.md**: The main logic that tells Claude how to analyze conversations and extract learnings
- **references/**: Supporting documentation that Claude reads when needed

The skill is **global** because it lives in your home directory (`~/.claude/`) and is available across all your projects.

### 2. Project Slash Command (`.claude/commands/reflect.md`)

This is the **trigger** for the system. It:

- Creates the `/reflect` command in your project
- Tells Claude to use the global reflect skill
- Specifies where to save learnings (your project's `CLAUDE.md`)

## How Claude Detects Learnings

### Signal Detection

Claude scans the conversation looking for specific patterns:

#### Explicit Corrections (HIGH confidence)
```
You: "No, don't use createClient() in API routes"
     ↓
Signal detected: Prohibition + specific context
     ↓
Learning: "NEVER use createClient() in API routes"
```

#### Successful Patterns (MEDIUM confidence)
```
Claude: [produces code using pattern X]
You: "Perfect, that works"
     ↓
Signal detected: Approval of pattern
     ↓
Learning: "Pattern X is acceptable"
```

#### Revealed Preferences (LOW confidence)
```
You: [writes comment in Portuguese]
     ↓
Signal detected: Language preference (single occurrence)
     ↓
Observation: "User may prefer Portuguese comments"
```

### Confidence Classification

| Level | Trigger | Action |
|-------|---------|--------|
| 🔴 HIGH | Direct correction, explicit rule | Add as strict rule |
| 🟡 MEDIUM | Pattern worked 2+ times | Add as preferred pattern |
| 🔵 LOW | Single observation | Add for future validation |

## The Reflection Flow

```
┌─────────────────────────────────────────┐
│ 1. USER RUNS /reflect                   │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│ 2. CLAUDE LOADS SKILL                   │
│    - Reads ~/.claude/skills/reflect/    │
│    - Loads SKILL.md instructions        │
│    - Has access to references/          │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│ 3. ANALYZE CONVERSATION                 │
│    - Scans entire conversation history  │
│    - Identifies correction patterns     │
│    - Notes successful approaches        │
│    - Observes preferences               │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│ 4. GENERATE REPORT                      │
│    - Groups findings by confidence      │
│    - Formats as structured report       │
│    - Creates diff of proposed changes   │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│ 5. USER REVIEWS                         │
│    - Sees report with all findings      │
│    - Sees exact changes proposed        │
│    - Chooses: Y (accept) / N / E (edit) │
└─────────────────────────────────────────┘
                    │
                    ▼ (if Y or E)
┌─────────────────────────────────────────┐
│ 6. UPDATE CLAUDE.md                     │
│    - Reads current file                 │
│    - Finds ## Session Learnings section │
│    - Appends new learnings              │
│    - Preserves existing content         │
└─────────────────────────────────────────┘
```

## Why Hybrid Architecture?

### Problem with Skill-Only Approach

If learnings were stored in the skill itself (`~/.claude/skills/reflect/SKILL.md`):
- ❌ Learnings would be global across ALL projects
- ❌ Project-specific knowledge would leak between projects
- ❌ Harder to version control with your project

### Problem with Command-Only Approach

If all logic were in the project command (`.claude/commands/reflect.md`):
- ❌ Logic would be duplicated in every project
- ❌ Updates to the reflection algorithm would need to be copied everywhere
- ❌ Inconsistent behavior across projects

### Hybrid Solution

By separating the **logic** (global skill) from the **storage** (project CLAUDE.md):
- ✅ Reflection logic is maintained in one place
- ✅ Learnings are project-specific
- ✅ Easy to version control learnings with your project
- ✅ Update the skill once, all projects benefit

## Customization Tips

### Adding Project-Specific Categories

Edit your project's `.claude/commands/reflect.md` to suggest categories:

```markdown
## Instructions

...

5. **Update CLAUDE.md** in the `## Session Learnings` section:
   - Group by category: Database, API, Frontend, Testing, DevOps
```

### Changing Confidence Thresholds

Edit `~/.claude/skills/reflect/references/confidence-levels.md` to adjust what qualifies for each level.

### Modifying Output Format

Edit `~/.claude/skills/reflect/references/output-format.md` to change how reports look.

## Maintenance

### Promoting Learnings

Over time, LOW confidence learnings that prove true should be promoted:

1. Validate the learning across multiple sessions
2. Move from 🔵 LOW to 🟡 MEDIUM
3. Eventually move confirmed rules to 🔴 HIGH
4. Consider moving stable HIGH learnings to main CLAUDE.md sections

### Pruning Outdated Learnings

Periodically review the Session Learnings section:

1. Remove learnings that are no longer relevant
2. Delete duplicates
3. Consolidate related learnings
4. Archive old learnings if needed

## Troubleshooting

### /reflect not found

1. Check `.claude/commands/reflect.md` exists in your project
2. Restart Claude Code to reload commands

### No learnings detected

The system is conservative by design. Try:
- Being more explicit in corrections ("Never do X, always do Y")
- Running /reflect after sessions with significant corrections

### Wrong language in output

The skill adapts to your conversation language. If you want consistent language:
- Add a note in your project's `.claude/commands/reflect.md`
- Example: "Always output in Portuguese (PT-BR)"