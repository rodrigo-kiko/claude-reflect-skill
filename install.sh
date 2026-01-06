#!/bin/bash

# Claude Reflect Skill - Installation Script
# This script installs the global skill to ~/.claude/skills/

set -e

echo "🪞 Installing Claude Reflect Skill..."
echo ""

# Check if we're in the right directory
if [ ! -f "skill/SKILL.md" ]; then
    echo "❌ Error: Please run this script from the claude-reflect-skill directory"
    echo "   cd claude-reflect-skill && ./install.sh"
    exit 1
fi

# Create skill directory
echo "📁 Creating skill directory..."
mkdir -p ~/.claude/skills/reflect/references

# Copy skill files
echo "📄 Copying skill files..."
cp skill/SKILL.md ~/.claude/skills/reflect/
cp skill/references/* ~/.claude/skills/reflect/references/

# Verify installation
echo ""
echo "✅ Global skill installed successfully!"
echo ""
echo "📍 Installed to: ~/.claude/skills/reflect/"
echo ""
echo "Files installed:"
ls -la ~/.claude/skills/reflect/
echo ""
ls -la ~/.claude/skills/reflect/references/
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📋 NEXT STEPS:"
echo ""
echo "1. Add the slash command to your project:"
echo "   mkdir -p .claude/commands"
echo "   cp project-command/reflect.md .claude/commands/"
echo ""
echo "2. Add the Session Learnings section to your CLAUDE.md:"
echo "   cat project-command/claude-md-section.md >> CLAUDE.md"
echo ""
echo "3. Use it! In Claude Code, type:"
echo "   /reflect"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"