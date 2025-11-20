# SEAL Learning Engine

**SEAL = Self-Adapting LLM**

## Purpose

SEAL makes AI get BETTER at building YOUR projects over time by learning from successful completions.

---

## How SEAL Works

### The Learning Loop

```
Task → Execute → Rate → Extract Patterns → Apply to Next Task → Improve
  ↑                                                                 ↓
  └─────────────────────────────────────────────────────────────────┘
```

### Three Phases of Learning

**Phase 1: Data Collection** (Tasks 1-5)
- Execute tasks using default approaches
- Record what works and what doesn't
- Build initial pattern library
- Low confidence patterns

**Phase 2: Pattern Emergence** (Tasks 6-15)
- Patterns start to form
- Apply patterns with caution
- Refine based on results
- Medium confidence patterns

**Phase 3: Automatic Application** (Tasks 16+)
- Strong patterns established
- Auto-apply with high confidence
- Minimal iteration needed
- High confidence patterns

---

## What SEAL Learns

### 1. Triage Patterns

**Learns**: What YOU consider trivial vs complex

**Example Evolution**:

```markdown
Task 1: "Change button color"
→ Classified: COMPLEX (default behavior)
→ Rating: 3/5 ("This was trivial, didn't need full planning")

Task 5: "Update header text"
→ Classified: TRIVIAL (learned from Task 1 feedback)
→ Rating: 5/5 ("Perfect, went straight to coding")

Pattern Formed (Confidence: 0.82):
- Trivial indicators: "change color", "update text", "fix typo"
- Complex indicators: "auth", "database", "new feature"
```

### 2. Discovery Patterns (Questions)

**Learns**: Which questions get useful answers from YOU

**Example Evolution**:

```markdown
Task 2: Phase 1.1 Discovery
Q: "What state management library do you prefer?"
A: "I don't know what that means"
→ Record: Technical question confused user

Task 3: Phase 1.1 Discovery
Q: "Should this work when internet is offline?"
A: "Yes! Users often lose connection"
→ Record: Outcome question got useful answer

Pattern Formed (Confidence: 0.88):
Effective questions:
- "What happens if user is offline?"
- "Does this need to work on mobile?"
- "How fast does this need to be?"

Ineffective questions:
- "State management preference?"
- "REST or GraphQL?"
- Technical jargon questions
```

### 3. Research Patterns (Where to Look)

**Learns**: Which files contain useful context for different task types

**Example Evolution**:

```markdown
Task 4: Bug fix in authentication
→ Checked: 10 files
→ Useful: src/auth/middleware.ts, src/lib/jwt.ts
→ Not useful: package.json, config files

Task 7: Another auth bug fix
→ Checked learned pattern: auth bugs
→ Looked at: src/auth/, src/lib/jwt.ts first
→ Found solution immediately

Pattern Formed (Confidence: 0.91):
For authentication tasks:
- Always check: src/auth/, middleware files
- Usually check: environment variables, types
- Rarely needed: config, package files
```

### 4. Architecture Preferences

**Learns**: Which approaches YOU actually choose

**Example Evolution**:

```markdown
Tasks 1-10: User chose "Simple/Monolith" 9 out of 10 times

Pattern Formed (Confidence: 0.93):
- User values simplicity over features
- Present simple option first with enthusiasm
- Only present complex if simple has dealbreaker limitation
- Frame complexity as "future headache reduction"
```

### 5. Coding Style Patterns

**Learns**: YOUR code conventions and style

**Example Evolution**:

```markdown
Task 3: Component created with class component
→ Rating: 3/5 ("Use functional components")

Task 6: Component created with functional component
→ Rating: 5/5 ("Exactly right")

Task 8: Another component
→ Applied pattern: functional component
→ Rating: 5/5

Pattern Formed (Confidence: 0.95):
- Components: Functional with hooks
- Naming: PascalCase
- Props: Destructure in parameter
- Styling: CSS Modules (not Tailwind for components)
- Always include: Loading states, TypeScript types
```

### 6. Testing Preferences

**Learns**: How YOU actually test

**Example Evolution**:

```markdown
Tasks 1-5: AI suggested unit tests
→ User never ran them

Tasks 6-10: AI provided manual test steps
→ User tested every time

Pattern Formed (Confidence: 0.89):
User testing approach:
- Prefers: Manual testing with clear steps
- Always tests: Network offline, mobile view, rapid clicking
- Never tests: Browser compatibility, a11y (not priority yet)
- Test script format: Numbered steps with expected outcomes
```

### 7. Documentation Preferences

**Learns**: What docs YOU actually want

**Example Evolution**:

```markdown
Tasks 1-5: AI wrote detailed technical docs
→ User rarely mentioned reading them

Tasks 6-10: AI wrote brief plain-English summaries
→ User referenced them frequently

Pattern Formed (Confidence: 0.87):
User wants in docs:
- What changed (in plain English)
- How to use new features
- Known limitations

User skips:
- Technical architecture details
- Deployment instructions (not deploying yet)
- API documentation (prefers code comments)
```

---

## Pattern Confidence System

### Confidence Levels

**Level 1: Experimental** (0.0 - 0.50)
- Based on 1-2 tasks
- Apply with extreme caution
- Ask for confirmation before using
- Likely to change

**Level 2: Emerging** (0.50 - 0.70)
- Based on 3-5 tasks
- Apply with caution
- Monitor results closely
- Still refining

**Level 3: Reliable** (0.70 - 0.85)
- Based on 6-10 tasks
- Apply with confidence
- Proven multiple times
- Minor refinements only

**Level 4: Best Practice** (0.85 - 0.95)
- Based on 11-15 tasks
- Apply automatically
- Highly consistent
- Rarely needs adjustment

**Level 5: Project Standard** (0.95 - 1.0)
- Based on 16+ tasks
- Always apply
- Proven across many contexts
- Part of project identity

### How Confidence Increases

```markdown
Task 1: Try approach A
→ Rating 5/5
→ Create pattern (Confidence: 0.33)

Task 2: Similar task, apply pattern
→ Rating 5/5
→ Update pattern (Confidence: 0.60)

Task 3: Similar task, apply pattern
→ Rating 5/5
→ Update pattern (Confidence: 0.78)

Task 5: Similar task, apply pattern
→ Rating 5/5
→ Update pattern (Confidence: 0.88)

Task 10: Similar task, apply pattern
→ Rating 5/5
→ Update pattern (Confidence: 0.95)
```

### When Confidence Decreases

```markdown
Pattern: "Use Redux for state" (Confidence: 0.82)

Task 15: Applied Redux pattern
→ Rating: 2/5 ("This was overkill, Context would've been fine")
→ Lower confidence (Confidence: 0.75)
→ Add note: "Use Context for simple state, Redux for complex only"

Task 16: Similar task, check pattern
→ Pattern now says "use Context for simple state"
→ Applied Context instead
→ Rating: 5/5
→ Confidence increases (Confidence: 0.80)
```

---

## Pattern Storage

All patterns stored in PROJECT-STATE.md Section 5.B

### Pattern Entry Format

```markdown
### [Pattern Name]

**Confidence**: 0.88
**Learned From**: 12 tasks
**Last Updated**: 2025-01-27

**When to Use**:
[Trigger condition]

**Steps**:
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Success Rate**: 11/12 tasks (92%)

**Examples**:
- Task #3: [Description] - Rating 5/5
- Task #7: [Description] - Rating 5/5
- Task #12: [Description] - Rating 4/5

**Notes**:
- [Important considerations]
- [Edge cases]
```

---

## SEAL Update Protocol

### After Every Task (Phase 4.3)

**Step 1: Ask for Rating**

```markdown
Rating (1-5): ___

What worked well:
-

What could be better:
-
```

**Step 2: Classify Task**

```markdown
Task Type: [Component Creation / API Integration / Bug Fix / etc.]
```

**Step 3: Determine if Successful**

```
If Rating >= 4: SUCCESS (learn from this)
If Rating <= 3: NEEDS IMPROVEMENT (note what to avoid)
```

**Step 4: Extract Success Factors (if successful)**

What specifically worked:
- Which files were useful?
- Which steps were smooth?
- What approach was chosen?
- What communication was clear?
- What decisions were good?

**Step 5: Update Patterns**

```
If pattern exists for this task type:
→ Refine pattern
→ Increase confidence
→ Add this task as example

If no pattern exists and 3+ similar successful tasks:
→ Create new pattern
→ Set initial confidence based on consistency
```

**Step 6: Update PROJECT-STATE.md**

- Section 5.A.2: Mark task complete
- Section 5.B: Update relevant patterns
- Section 5.C: Update if structure changed
- Section 5.D: Update if bugs found
- Section 5.E: Update if new rules discovered

---

## Pattern Application

### Before Starting a Task

**Step 1: Load PROJECT-STATE.md**

**Step 2: Check for Relevant Patterns**

```
Task: "Create a Settings page"
→ Check Section 5.B for "Page Creation" patterns
→ Check Section 5.B for "Component Creation" patterns
→ Check Section 5.C for established structure
```

**Step 3: Evaluate Pattern Confidence**

```
Pattern Found: "Page Component Structure" (Confidence: 0.92)

If Confidence >= 0.85:
→ Apply automatically
→ Mention to user: "Applying learned pattern"

If Confidence 0.70 - 0.84:
→ Apply with notification
→ "Using established pattern (confidence 0.78)"
→ Monitor for issues

If Confidence < 0.70:
→ Ask for confirmation
→ "Found an emerging pattern. Should I apply it?"
```

**Step 4: Apply Pattern**

Follow pattern steps while:
- Noting any deviations
- Recording why deviations were needed
- Tracking success of each step

**Step 5: Update After Completion**

If pattern worked:
→ Increase confidence
→ Add as successful example

If pattern didn't work:
→ Note what failed
→ Adjust pattern
→ Possibly decrease confidence

---

## Meta-Patterns (Every 10 Tasks)

### Pattern Synthesis

After every ~10 tasks, analyze patterns across task types:

**Look for**:
- Common success factors across different tasks
- Approaches that work universally
- User preferences that apply broadly

**Example Meta-Pattern**:

```markdown
After 30 tasks across multiple types, noticed:

Common Success Factor: "Check existing similar code first"

Applied in:
- Component creation (10 tasks)
- API integration (8 tasks)
- Bug fixes (12 tasks)

Success rate when applied: 94%
Success rate when skipped: 67%

→ Create meta-pattern: "Always research existing patterns first"
→ Apply to ALL task types
→ Confidence: 0.94
```

---

## SEAL Benefits Over Time

### Week 1 (Tasks 1-5)

- AI follows workflow consistently
- Code quality stable
- Learning your preferences
- **Result**: Predictable, methodical work

### Week 2-3 (Tasks 6-15)

- Patterns emerging
- Fewer clarifying questions needed
- AI anticipates your needs
- **Result**: Faster execution, fewer iterations

### Week 4+ (Tasks 16-30)

- Strong patterns established
- Automatic pattern application
- High first-try success rate
- **Result**: Significant time savings

### Month 2+ (Tasks 31+)

- Pattern library comprehensive
- Minimal intervention needed
- New features follow established patterns automatically
- **Result**: AI becomes "your personal expert"

---

## Success Metrics

Track in PROJECT-STATE.md Section 5.F:

**Primary Metrics**:
- **Overall Success Rate**: % of tasks rated ≥ 4
- **First-Try Success**: % completed without iteration
- **Average Iterations**: How many back-and-forths per task
- **Pattern Coverage**: % of tasks with applicable patterns

**Secondary Metrics**:
- Pattern confidence trends (should increase)
- Time per task (should decrease)
- Questions needed per task (should decrease)
- User satisfaction trend (should increase)

**Goal Benchmarks**:
- Success Rate: ≥ 80% by Task 20
- First-Try Success: ≥ 50% by Task 30
- Average Iterations: ≤ 1.5 by Task 30
- Pattern Coverage: ≥ 70% by Task 40

---

## Troubleshooting SEAL

### "Patterns aren't improving"

**Possible causes**:
- Not rating tasks consistently
- Ratings too generous (give honest feedback)
- Not enough similar tasks to form patterns
- Tasks too varied (need 3+ similar tasks)

**Solutions**:
- Rate every task honestly
- Look for task clustering
- Complete similar tasks in sequence

### "AI applying wrong patterns"

**Possible causes**:
- Pattern confidence too high too early
- Task misclassified
- Pattern too broad

**Solutions**:
- Manually lower confidence in PROJECT-STATE.md
- Improve task classification triggers
- Split broad patterns into specific ones

### "Patterns not being applied"

**Possible causes**:
- Confidence too low (< 0.7)
- Pattern entry malformed
- AI not loading PROJECT-STATE.md

**Solutions**:
- Check pattern confidence scores
- Verify JSON/markdown syntax
- Ensure AI loads PROJECT-STATE.md at start

---

## SEAL Philosophy

**Traditional AI**: Same behavior every time, no learning

**SEAL AI**: Adapts to YOUR project, YOUR style, YOUR preferences

**Result**: After 30 tasks, AI that feels like it "knows" your project.

---

**SEAL is the difference between a tool and a teammate.**
