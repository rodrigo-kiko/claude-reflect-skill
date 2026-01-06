---
description: Analyze this session and extract learnings to CLAUDE.md
allowed-tools: Read, Write, Glob, Grep, View
---

# Reflect on Development Session

Analyze our conversation to extract valuable learnings and update the project's CLAUDE.md.

## Instructions

1. **Use the reflect skill** from ~/.claude/skills/reflect/ to analyze this conversation

2. **Scan the entire conversation** looking for:
   - Corrections I made to your code or approach
   - Patterns that worked well and I approved
   - Preferences I revealed through my feedback

3. **Generate the analysis report** showing:
   - All detected signals grouped by confidence
   - Source/context for each learning
   - Exact diff of proposed CLAUDE.md changes

4. **Wait for my approval** before making any changes:
   - Show me the report first
   - I will choose Y (accept), N (reject), or E (edit)
   - Only update CLAUDE.md after I approve

5. **Update CLAUDE.md** in the `## Session Learnings` section:
   - Preserve all existing content
   - Append new learnings under correct confidence level
   - Add today's date to each learning
   - Group by category (Supabase, Stripe, Next.js, etc.)

## Target File

`./CLAUDE.md` - Update the "## Session Learnings" section

## Important Rules

- Be CONSERVATIVE: Only add high-value, actionable learnings
- Check existing CLAUDE.md first to avoid duplicates
- Never contradict existing documented rules
- Always show diff preview before any changes
- Match my working language for all output text