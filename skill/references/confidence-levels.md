# Confidence Level Classification

## 🔴 HIGH CONFIDENCE

**Definition**: Direct, unambiguous instruction or correction from user.

**Criteria - Include when:**
- User explicitly says "never" or "always"
- User corrects a specific mistake with explanation
- User states a clear rule for the project
- Technical error was identified, explained, and fixed
- User provides explicit instruction for future behavior

**Examples:**
- "Never use createClient() in API routes" → HIGH
- "Always add webhook routes to publicRoutes array" → HIGH  
- "Use type guards instead of 'as any'" → HIGH
- "The Stripe API changed, use items.data[0] for periods" → HIGH

**Action**: Add immediately to CLAUDE.md, these are valuable rules.

---

## 🟡 MEDIUM CONFIDENCE

**Definition**: Pattern worked well without explicit confirmation but with implicit approval.

**Criteria - Include when:**
- Approach was used and user didn't correct it
- User accepted output and moved forward
- Pattern was used successfully 2+ times
- User built upon the approach (extension = approval)
- Implicit preference through consistent behavior

**Examples:**
- Separate queries + Map() pattern accepted multiple times → MEDIUM
- Detailed error logging kept in all API routes → MEDIUM
- Component structure used without modification → MEDIUM
- User always asks for Portuguese comments → MEDIUM

**Action**: Add to CLAUDE.md, but mark for potential promotion to HIGH later.

---

## 🔵 LOW CONFIDENCE

**Definition**: Single observation that needs future validation.

**Criteria - Include when:**
- Only one occurrence, not yet confirmed as pattern
- Style preference that could be situational
- Inferred from limited data points
- Could be context-dependent, not universal
- Observation without explicit approval

**Examples:**
- User used Portuguese in one comment → LOW
- User seemed to prefer shorter responses once → LOW
- One instance of specific file organization → LOW

**Action**: Add to CLAUDE.md for tracking, validate in future sessions.

---

## ❌ EXCLUSION CRITERIA

**Do NOT add learnings that:**
- Already exist in CLAUDE.md (check first!)
- Contradict existing documented rules
- Are generic best practices ("write tests")
- Are common sense for any developer
- Were clearly one-time situational decisions
- Are too vague to be actionable
- Apply to all projects, not specifically this one