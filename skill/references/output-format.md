# Output Format Specification

## Report Structure

Use this exact format for the analysis report:

📊 SESSION ANALYSIS REPORT
══════════════════════════════════════════════════════════════

🔍 Signals Detected: [TOTAL_COUNT]

══════════════════════════════════════════════════════════════

🔴 HIGH CONFIDENCE ([count]):

[number]. [icon] "[Learning summary in user's language]"
   └─ Source: [Brief quote or description of where in conversation]
   └─ Rule: [Actionable rule to add]

[repeat for each HIGH item]

──────────────────────────────────────────────────────────────

🟡 MEDIUM CONFIDENCE ([count]):

[number]. [icon] "[Pattern description in user's language]"
   └─ Context: [How/where it was used successfully]
   └─ Pattern: [What to document]

[repeat for each MEDIUM item]

──────────────────────────────────────────────────────────────

🔵 LOW CONFIDENCE ([count]):

[number]. [icon] "[Observation in user's language]"
   └─ Note: [Why it needs validation]

[repeat for each LOW item]

══════════════════════════════════════════════════════════════

📝 PROPOSED CHANGES TO CLAUDE.md:

Show exact additions in diff format. Each new line starts with + prefix:

+ ### 🔴 HIGH CONFIDENCE (Strict Rules)
+
+ #### [Category]
+ - **[Topic]**: [Rule description]
+   - Added: [DATE]
+   - Context: [Why this matters]

══════════════════════════════════════════════════════════════

⚡ ACTIONS:

[Y] Accept all changes and update CLAUDE.md
[N] Reject all - no changes made
[E] Edit - let me modify before applying
[1-N] Discuss specific item before deciding

Your choice: _

## Icons Reference

- ❌ Correction (something was wrong, now fixed)
- ✅ Explicit rule (user stated clearly)
- ✓ Pattern worked (implicit approval)
- ⚡ Strong signal (multiple confirmations)
- ? Observation (needs validation)
- 💡 Insight (inferred preference)

## Diff Format Rules

Show proposed additions with + prefix at the start of each new line.
This makes it clear what will be added to CLAUDE.md.

Example:
+ #### Supabase
+ - **API Routes**: NEVER use createClient() in API routes
+   - Added: 2025-01-06
+   - Context: Causes 500 errors. Use createServerSupabaseClient().

## Empty Sections

If no learnings detected for a confidence level, show:

🔴 HIGH CONFIDENCE (0):
   No high-confidence learnings detected in this session.

## Multiple Learnings Same Category

Group under category header:

+ #### Stripe
+ - **Webhook Routes**: Always add to publicRoutes in middleware.ts
+   - Added: 2025-01-06
+   - Context: Prevents 307 redirects that break webhook delivery
+
+ - **API Version**: Handle breaking changes in subscription.items.data[0]
+   - Added: 2025-01-06
+   - Context: current_period_start/end moved in API version 2025-03-31+