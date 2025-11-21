# PROJECT STATE

> **Copy this file to `.vibecoding/PROJECT-STATE.md` in your project root**

**System Integration**: This file is the single source of truth for AI state.
- Loaded at start of every session per [04-ai-instructions.md](04-ai-instructions.md)
- Updated after every task per [01-workflow-protocol.md](01-workflow-protocol.md) Phase 4.3
- Pattern storage format defined in [02-seal-engine.md](02-seal-engine.md)
- Metrics tracked per [00-core-philosophy.md](00-core-philosophy.md) Section: Success Metrics

---

## QUICK REFERENCE

**Project Name:** [Your Project Name]
**Started:** YYYY-MM-DD
**Last Updated:** YYYY-MM-DD HH:MM
**Status:** [Planning / Active Development / Testing / Maintenance]

**Current Task:** #___ - [Task Description]
**Current Phase:** [0 / 1 / 2 / 3 / 4]
**Waiting For:** [User Input / Testing / Nothing]
**Next Step:** [What happens next]

---

## 1. PROJECT INFORMATION

**Tech Stack:**
- Frontend: [e.g., Next.js 14, React 18]
- Backend: [e.g., Next.js API Routes, Express]
- Database: [e.g., PostgreSQL, MongoDB, None yet]
- Styling: [e.g., Tailwind CSS, CSS Modules]
- Key Libraries: [List important dependencies]

**Deployment:**
- Dev: [e.g., localhost:3000]
- Production: [e.g., Vercel, Not deployed yet]

**Repository:**
- URL: [GitHub URL]
- Branch: [e.g., main]

---

## 2. TASK LOG

### Task #1: [Example Task - DELETE THIS]
- **Date:** 2025-01-20
- **Type:** Setup
- **Status:** Completed ✅
- **Phase:** 2 (Coding)
- **Rating:** 5/5
- **Files Modified:**
  - package.json
  - src/app/page.tsx
- **Notes:** Initial Next.js setup. User prefers npm over yarn.
- **Learned:** Package manager preference: npm

---

### Task #2: [Your First Task Will Go Here]
- **Date:**
- **Type:** [Feature / Bug Fix / Refactor / Setup]
- **Status:** [Planned / In Progress / Completed / Blocked]
- **Phase:** [0-4]
- **Rating:** [1-5 after completion]
- **Files Modified:**
  - [List files]
- **Notes:**
- **Learned:**

---

### Task #3: [Future Task]
...

---

## 3. BACKLOG

**Next Up:**
1. [Task description]
2. [Task description]

**Future Ideas:**
- [Feature idea]
- [Improvement idea]

**Blocked:**
- [Task] - Blocked because: [Reason]

---

## 4. PROJECT STRUCTURE

```
project-root/
├── .vibecoding/
│   └── PROJECT-STATE.md          [This file]
├── vibecoding-os/                [Git submodule - system files]
├── src/
│   ├── app/                      [Add structure as discovered]
│   ├── components/
│   └── lib/
├── package.json
└── README.md
```

**Key Files:**
- `[file path]`: [Purpose/description]

**Naming Conventions:**
- Components: [e.g., PascalCase.tsx]
- Utilities: [e.g., camelCase.ts]
- Styles: [e.g., component.module.css]

---

## 5. SEAL LEARNED PATTERNS

*AI will populate this as patterns emerge*

### 5.1: Triage Patterns

**Confidence:** 0.00 (no data yet)
**Learned From:** 0 tasks

**Trivial Indicators:**
- [AI will learn what YOU consider trivial]

**Complex Indicators:**
- [AI will learn what YOU consider complex]

---

### 5.2: Discovery Patterns (Questions)

**Confidence:** 0.00
**Learned From:** 0 tasks

**Effective Questions:**
- [Questions that get useful answers from YOU]

**Ineffective Questions:**
- [Questions that confuse YOU]

**Your Communication Style:**
- [Notes about how you communicate]

---

### 5.3: Research Patterns (Where to Look)

**Confidence:** 0.00
**Learned From:** 0 tasks

**For Feature Addition:**
- Always check: [File paths AI learns are useful]
- Usually check: [File paths sometimes useful]
- Rarely needed: [File paths not usually helpful]

**For Bug Fix:**
- Always check: [Learned patterns]

**For UI Changes:**
- Always check: [Learned patterns]

---

### 5.4: Architecture Preferences

**Confidence:** 0.00
**Learned From:** 0 decisions

**You Typically Choose:**
- [e.g., Simple/Monolith 90% of time]

**You Value:**
- Simplicity: [High/Medium/Low - AI will learn]
- Features: [High/Medium/Low - AI will learn]
- Future-proofing: [High/Medium/Low - AI will learn]

---

### 5.5: Coding Style Patterns

**Confidence:** 0.00
**Learned From:** 0 tasks

**Naming Conventions:**
- Components: [AI will learn your style]
- Functions: [AI will learn your style]
- Files: [AI will learn your style]

**Code Structure:**
- Prefer: [e.g., Functional components - AI will learn]
- Avoid: [e.g., Class components - AI will learn]
- Always include: [e.g., TypeScript types - AI will learn]

**Error Handling:**
- Style: [e.g., Toast notifications - AI will learn]
- Logging: [e.g., Descriptive console.logs - AI will learn]

---

### 5.6: Testing Preferences

**Confidence:** 0.00
**Learned From:** 0 tasks

**Testing Approach:**
- Primary: [e.g., Manual testing - AI will learn]
- Secondary: [e.g., Unit tests for critical logic - AI will learn]

**You Actually Test:**
- [e.g., Network offline - AI will learn]
- [e.g., Mobile view - AI will learn]

**You Skip:**
- [e.g., Browser compatibility - AI will learn]

---

### 5.7: Documentation Preferences

**Confidence:** 0.00
**Learned From:** 0 tasks

**You Want in Docs:**
- [AI will learn what you actually read]

**You Skip:**
- [AI will learn what you ignore]

**Style:**
- Tone: [AI will learn your preference]
- Length: [AI will learn your preference]

---

### 5.8: UI Patterns

**Confidence:** 0.00
**Learned From:** 0 tasks

**Component Structure:**
- Directory: [AI will learn your structure]
- Files: [AI will learn your patterns]

**Styling Approach:**
- Method: [AI will learn CSS Modules/Tailwind/etc.]
- Responsive: [AI will learn your approach]

---

### 5.9: Dummy Data Preferences

**Confidence:** 0.00
**Learned From:** 0 tasks

**Good Dummy Data:**
- [AI will learn what you like]

**Avoid:**
- [AI will learn what confuses you]

---

### 5.10: Custom Patterns

*AI will add project-specific patterns here as they emerge*

---

## 6. KNOWN ISSUES & RISKS

### Bugs Fixed (History)

**Bug #1:** [Example - DELETE THIS]
- **Task:** #5
- **Date:** 2025-01-22
- **Issue:** Login form not validating email
- **Root Cause:** Regex pattern was incorrect
- **Solution:** Updated to standard email regex
- **Prevention:** Added validation tests

---

*AI will add bugs as they occur*

---

### Current Known Issues

**Issue #1:**
- **Severity:** [Critical / High / Medium / Low]
- **Description:** [What's broken]
- **Workaround:** [Temporary solution if any]
- **Planned Fix:** [Task #X or "Not scheduled"]

---

*AI will track unresolved issues*

---

### Actual Risks Encountered

**Risk:** [e.g., API Rate Limits]
- **Occurred:** 0 times
- **Tasks Affected:** None yet
- **Mitigation:** [What works when this happens]

---

*AI will update as risks actually happen (not theoretical)*

---

### Dependencies & Versions

**Critical Dependencies:**
- `[package-name]`: v[X.X.X] - [Why it's critical]

**Version Compatibility Notes:**
- [e.g., "Next.js 14 requires Node 18+"]

**Avoid:**
- [Packages tried and rejected] - [Why]

---

## 7. PROJECT RULES & QUIRKS

*AI will add project-specific learnings here*

### Project-Specific Rules

1. [e.g., "Always use server components unless client interaction needed"]
2. [Rules discovered during development]

### Codebase Quirks

- [e.g., "Auth token in localStorage, not cookies (legacy decision)"]
- [Weird behaviors specific to this project]

### Your Preferences (Non-Technical)

- [e.g., "User prefers blue for success, not green (brand colors)"]
- [Your specific preferences discovered over time]

---

## 8. METRICS & IMPROVEMENT

### Task Metrics

**Total Tasks Completed:** 0
**Success Rate (Rating ≥ 4):** 0/0 = N/A
**Average Iterations Per Task:** N/A
**Pattern Coverage:** 0% (no patterns yet)

### Pattern Confidence Trends

*AI will track pattern confidence growth*

**Strongest Patterns:**
1. [None yet]

**Weakest Patterns (Need More Data):**
1. [None yet]

### Improvement Notes

**What's Working Well:**
- [AI will note successful approaches]

**What Needs Improvement:**
- [AI will note struggles]

**Next Focus Areas:**
1. [Patterns that need development]

---

## 9. NOTES & CONTEXT

### Important Decisions

*Record major architectural or design decisions*

**Decision #1:** [Example - DELETE THIS]
- **Date:** 2025-01-20
- **Context:** Choosing between Next.js and separate React/Express
- **Decision:** Next.js (monolith approach)
- **Reasoning:** Keep It Boring principle - one codebase easier to maintain
- **Alternatives Considered:** React + Express (rejected: added complexity)

---

### External Resources

**Documentation:**
- [Link to design mockups]
- [Link to API documentation]
- [Link to brand guidelines]

**Credentials:**
- [Note where credentials are stored - never put actual credentials here]

---

## HOW TO USE THIS FILE

### For AI:

**At Start of Every Session**:
1. Read this entire file per [04-ai-instructions.md](04-ai-instructions.md) Rule 5
2. Load patterns from Section 5.B per [02-seal-engine.md](02-seal-engine.md) Section: Pattern Application
3. Check current task and phase from [01-workflow-protocol.md](01-workflow-protocol.md)

**After Every Completed Task**:
1. Update per [01-workflow-protocol.md](01-workflow-protocol.md) Phase 4.3
2. Follow SEAL Update Protocol from [02-seal-engine.md](02-seal-engine.md)
3. Update metrics per [00-core-philosophy.md](00-core-philosophy.md) Section: Success Metrics

**Before Starting Any Task:**
1. Check Section 5.B for relevant patterns
2. Check Section 4 for project structure
3. Check Section 6 for known issues

### For User:

**You should:**
- Review this file weekly
- Check that patterns make sense
- Edit if AI learned something wrong
- Add to backlog as ideas come up

**You don't need to:**
- Manually update task logs (AI does this)
- Calculate metrics (AI does this)
- Maintain pattern confidence (AI does this)

---

**This file is the single source of truth for your project state.**

**It survives:**
- ✅ Context window resets
- ✅ Switching between AI agents
- ✅ Weeks-long project pauses
- ✅ Team collaboration

**Keep it updated and your project will never lose momentum.**
