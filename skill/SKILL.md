---
name: reflect
description: Analyzes development sessions to extract learnings from corrections, successful patterns, and revealed preferences. Use when the user wants to reflect on a coding session, extract lessons learned, or update project knowledge. Triggered by /reflect command or phrases like "reflect on this session", "what did we learn today", "extract learnings".
---

# Reflect Skill - Session Analysis & Learning Extraction

This skill analyzes development conversations to extract actionable learnings that improve future coding sessions by updating the project's CLAUDE.md file.

## Language Adaptation

Detect and match the user's working language for all outputs:
- Session analysis reports
- Learning descriptions
- Proposed changes
- Confirmation prompts

Keep technical terms (file paths, function names, code snippets) in their original form.

## Core Workflow

### Step 1: Scan Entire Conversation

Analyze the COMPLETE current conversation looking for signals. See `references/signal-patterns.md` for detailed patterns.

**Primary signals to detect:**

1. **Explicit Corrections** → HIGH confidence
   - User says "No, don't do X" / "Use Y instead"
   - User states "Never/Always do X"
   - User explains why something was wrong

2. **Successful Patterns** → MEDIUM confidence
   - Approaches that worked without objection
   - Code patterns user accepted
   - Structures repeated successfully

3. **Revealed Preferences** → LOW confidence
   - Style choices (naming, comments, structure)
   - Communication preferences
   - Single observations needing validation

### Step 2: Classify by Confidence Level

Apply criteria from `references/confidence-levels.md`:

- **HIGH**: Direct, unambiguous corrections or rules from user
- **MEDIUM**: Patterns that worked well, implicit preferences confirmed by acceptance
- **LOW**: Single observations that need future validation

### Step 3: Generate Analysis Report

Format output per `references/output-format.md`:

1. Summary header with signal count
2. Learnings grouped by confidence level
3. Source reference for each learning
4. Diff preview of proposed CLAUDE.md changes
5. Action prompt for user approval

### Step 4: Apply Changes (ONLY with explicit approval)

**CRITICAL RULES:**
- NEVER modify any file without explicit user approval
- Show EXACT diff of what will be added
- Wait for user to type Y, N, or E
- Preserve ALL existing content in CLAUDE.md

**Update process:**
1. Read current CLAUDE.md
2. Find `## Session Learnings` section (or create if missing)
3. Append new learnings under appropriate confidence subsection
4. Add timestamp to each learning
5. Write updated file only after approval

## Target File Resolution

Learnings are written to the project's CLAUDE.md:

1. Look for `CLAUDE.md` in current working directory
2. Find section `## Session Learnings`
3. If section doesn't exist, create it at the end of file
4. Append new learnings (never overwrite existing ones)

## Learning Format in CLAUDE.md

Use this exact structure:

```markdown
## Session Learnings

> Auto-updated by /reflect command. Review periodically and promote stable learnings to main sections.

### 🔴 HIGH CONFIDENCE (Strict Rules)

#### [Category Name]
- **[Topic]**: [Clear rule description]
  - Added: [YYYY-MM-DD]
  - Context: [Why this matters, what went wrong]

### 🟡 MEDIUM CONFIDENCE (Preferred Patterns)

#### [Category Name]
- **[Pattern]**: [Description of what works well]
  - Added: [YYYY-MM-DD]

### 🔵 LOW CONFIDENCE (Observations)

- [Observation that needs validation]
  - Added: [YYYY-MM-DD]
```

## Quality Guidelines

**BE CONSERVATIVE** - Better to miss a learning than add noise.

**DO add learnings that are:**
- Specific to this project's tech stack
- Actionable and clear
- Not already in CLAUDE.md
- Likely to prevent future mistakes

**DO NOT add learnings that are:**
- Generic common sense ("write clean code")
- Already documented in CLAUDE.md
- One-time situational decisions
- Contradicting existing rules
- Too vague to be actionable

## Categories for This Project

Group learnings by relevant categories such as:
- Supabase (client patterns, RLS, queries)
- Stripe (webhooks, subscriptions, API)
- Next.js (API routes, middleware, components)
- TypeScript (types, patterns)
- Database (schema, migrations)
- Authentication (flows, security)
- UI/UX (components, patterns)