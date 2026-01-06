# 🪞 Claude Code Reflect Skill

> **Self-improving AI sessions**: Extract learnings from your development conversations and never repeat the same mistakes.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blueviolet)](https://claude.ai/code)

## 🎯 What is this?

A **hybrid skill + slash command system** for Claude Code that analyzes your development sessions and automatically extracts learnings from:

- ❌ **Corrections** you made ("No, don't use X, use Y instead")
- ✅ **Successful patterns** that worked well
- 💡 **Preferences** you revealed through feedback

These learnings are saved to your project's `CLAUDE.md` file, so Claude remembers them in future sessions.

## 🧠 The Problem This Solves

Without memory, every Claude Code session starts from zero:

```
Session 1: Claude makes mistake → You correct it
Session 2: Claude makes the SAME mistake → You correct it again
Session 3: Claude makes the SAME mistake → Frustration!
```

With `/reflect`:

```
Session 1: Claude makes mistake → You correct it → Run /reflect → Learning saved
Session 2: Claude reads CLAUDE.md → Doesn't make that mistake again ✨
```

## 🏗️ Architecture

This system uses a **hybrid architecture** that separates reusable logic from project-specific learnings:

```
GLOBAL (reusable across ALL your projects):
~/.claude/skills/reflect/
├── SKILL.md                      # Core reflection logic
└── references/
    ├── signal-patterns.md        # How to detect corrections/patterns
    ├── confidence-levels.md      # HIGH/MEDIUM/LOW criteria
    └── output-format.md          # Report format specification

PROJECT-SPECIFIC (each project has its own learnings):
your-project/
├── .claude/commands/reflect.md   # Slash command that invokes the skill
└── CLAUDE.md                     # Learnings are saved here
```

## 📦 Installation

### Step 1: Clone this repository

```bash
git clone https://github.com/rodrigo-kiko/claude-reflect-skill.git
cd claude-reflect-skill
```

### Step 2: Install the Global Skill

```bash
# Create the skill directory
mkdir -p ~/.claude/skills/reflect/references

# Copy skill files
cp skill/SKILL.md ~/.claude/skills/reflect/
cp skill/references/* ~/.claude/skills/reflect/references/
```

### Step 3: Add to Your Project

In each project where you want to use `/reflect`:

```bash
# Navigate to your project
cd /path/to/your/project

# Create commands directory
mkdir -p .claude/commands

# Copy the slash command
cp /path/to/claude-reflect-skill/project-command/reflect.md .claude/commands/
```

### Step 4: Add Session Learnings Section to CLAUDE.md

Add this section to the **end** of your project's `CLAUDE.md` file:

```markdown
---

## Session Learnings

> This section is auto-updated by the `/reflect` command.
> Contains learnings extracted from development sessions.
> Review periodically and promote stable learnings to main documentation sections above.
>
> Last updated: [Will be set by /reflect]

### 🔴 HIGH CONFIDENCE (Strict Rules)

<!-- High-confidence learnings will be added here by /reflect -->

### 🟡 MEDIUM CONFIDENCE (Preferred Patterns)  

<!-- Medium-confidence learnings will be added here by /reflect -->

### 🔵 LOW CONFIDENCE (Observations)

<!-- Low-confidence observations will be added here by /reflect -->
```

Or use the provided template:

```bash
cat project-command/claude-md-section.md >> CLAUDE.md
```

## 🚀 Usage

### During Development

Work normally with Claude Code. When you correct mistakes or approve approaches, Claude will pick up on these signals.

### At the End of a Session

Run the reflect command:

```
/reflect
```

### Review and Approve

Claude will show you a report with detected signals grouped by confidence level. Choose:
- **Y** - Accept all changes
- **N** - Reject everything
- **E** - Edit before applying

## 🎚️ Confidence Levels

| Level | Meaning | Examples |
|-------|---------|----------|
| 🔴 **HIGH** | Direct, explicit corrections | "Never do X", "Always use Y" |
| 🟡 **MEDIUM** | Patterns that worked without objection | Accepted code, repeated approaches |
| 🔵 **LOW** | Single observations needing validation | Style preferences, one-time choices |

## 🌍 Language Support

The skill automatically adapts to your working language:

- If you work in **Portuguese**, reports and learnings will be in Portuguese
- If you work in **English**, everything will be in English
- Technical terms (file paths, function names) remain unchanged

## 📁 File Structure

```
claude-reflect-skill/
├── README.md                          # This file
├── LICENSE                            # MIT License
├── skill/                             # Global skill (install to ~/.claude/skills/)
│   ├── SKILL.md                       # Main skill logic
│   └── references/
│       ├── signal-patterns.md         # Detection patterns
│       ├── confidence-levels.md       # Classification criteria
│       └── output-format.md           # Report format
├── project-command/                   # Per-project files
│   ├── reflect.md                     # Slash command
│   └── claude-md-section.md           # Template for CLAUDE.md
└── docs/
    └── how-it-works.md                # Detailed explanation
```

## 💡 Tips

1. **Run `/reflect` at natural breakpoints** - End of feature, end of day, after fixing a tricky bug

2. **Review before approving** - The AI is conservative, but you should still verify learnings make sense

3. **Promote stable learnings** - After a learning has been validated across multiple sessions, move it from "Session Learnings" to the main CLAUDE.md sections

4. **Be explicit when correcting** - Saying "Never do X because Y" gives clearer signals than just fixing code silently

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see [LICENSE](LICENSE) file.

## 🙏 Credits

- Built for the [SocialPrompts.ai](https://socialprompts.ai) project
- Created by [Rodrigo Pinto](https://github.com/rodrigo-kiko)

---

**⭐ If this helped you, please star the repo!**