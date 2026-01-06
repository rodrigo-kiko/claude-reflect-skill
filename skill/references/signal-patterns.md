# Signal Detection Patterns

## Explicit Corrections (HIGH Confidence)

### Negation + Instruction
Pattern: User rejects approach and provides correct one
- "No, don't [X]" → Never do X
- "That's wrong, use [Y]" → Use Y instead
- "Actually, it should be [Z]" → Correct approach is Z

### Imperative Rules  
Pattern: User states absolute rule
- "Always [X]" → Required practice
- "Never [X]" → Prohibited practice
- "Make sure to [X]" → Mandatory step
- "You must [X]" → Non-negotiable rule

### Error Corrections
Pattern: User identifies and corrects mistake
- "This causes [error] because [reason]" → Anti-pattern identified
- "The bug was [X]" → Thing to avoid
- "[X] breaks when [Y]" → Incompatibility rule

### Explicit Explanations
Pattern: User explains the right way
- "Use [X] because [reason]" → Best practice with context
- "The correct pattern is [X]" → Documented pattern
- "In this project we [X]" → Project convention

## Successful Patterns (MEDIUM Confidence)

### Accepted Output
Pattern: User accepts without modification
- No objection after code review → Pattern acceptable
- "Perfect" / "That works" → Confirmed approach
- User proceeds to next task → Implicit approval

### Repeated Usage
Pattern: Same approach used multiple times successfully
- Pattern used 2+ times without correction → Established pattern
- Consistent structure across files → Convention
- Same naming style maintained → Style preference

### User Builds Upon
Pattern: User extends rather than replaces
- User adds to the code → Base approach was correct
- User asks for more of same style → Style confirmed
- User references it positively later → Pattern validated

## Revealed Preferences (LOW Confidence)

### Style Observations
- Comment language (PT-BR vs EN)
- Variable naming conventions
- File organization choices
- Code verbosity level
- Error message style

### Communication Preferences
- Response length (concise vs detailed)
- Explanation depth (high-level vs step-by-step)
- Format preferences (bullets vs prose)
- Technical depth level

### Single Occurrences
- One-time decision that might be situational
- Preference shown but not confirmed
- Style choice without explicit approval