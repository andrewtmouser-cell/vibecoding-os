# Vibecoding OS - Terminology Glossary

**Purpose**: Define all terms used in Vibecoding OS to ensure consistency across all documentation files.

**Date Created**: 2025-01-21
**Status**: Master Reference - All files must conform to these terms

---

## Core System Terms

### Vibecoding OS
**Official term**: Vibecoding OS
**Usage**: The complete system/methodology
**Do NOT use**: Vibecoding System, VibecodeOS, Vibe-coding

### Vibecoder
**Official term**: Vibecoder (capitalized)
**Definition**: A non-technical builder using AI to create software
**Plural**: Vibecoders
**Do NOT use**: vibe-coder, vibe coder, vibedev

---

## Workflow Terms

### Phase
**Official term**: Phase (capitalized when referring to specific phase)
**Usage**: "Phase 0", "Phase 1", "Phase 2", "Phase 3", "Phase 4"
**Definition**: Top-level workflow stage
**Do NOT use**: Stage, Step (for top level)

**The 5 Phases**:
- Phase 0: Triage
- Phase 1: Planning
- Phase 2: Coding
- Phase 3: Testing
- Phase 4: Review

### Subphase
**Official term**: Subphase
**Usage**: "Phase 1.1", "Phase 1.2", etc.
**Definition**: Subdivisions within Phase 1 and Phase 2
**Do NOT use**: Sub-phase, sub phase, substage, step (when referring to subphases)

**Phase 1 Subphases**:
- Phase 1.1: Discovery
- Phase 1.2: Research
- Phase 1.3: Brainstorm
- Phase 1.4: Evaluation
- Phase 1.5: Premortem
- Phase 1.6: Specification
- Phase 1.7: Approval

**Phase 2 Subphases**:
- Phase 2.1: Scaffolding
- Phase 2.2: Connectivity
- Phase 2.3: Core Logic
- Phase 2.4: UI Binding

### Step
**Official term**: Step
**Usage**: Numbered actions within a subphase (Step 1, Step 2, etc.)
**Definition**: Individual actions within a subphase
**Example**: "Phase 1.1, Step 3: Ask outcome-focused questions"

### Stop & Wait
**Official term**: Stop & Wait
**Usage**: "STOP & WAIT" (all caps in workflow instructions)
**Definition**: Checkpoint where AI must wait for user confirmation before proceeding
**Located in**: Phase 1 subphases
**Do NOT use**: Approval Gate, Wait Point, Checkpoint (when referring to this specific concept)

### Check
**Official term**: Check (with checkpoint name)
**Usage**: "Scaffolding Check", "Connectivity Check", etc.
**Definition**: Verification point in Phase 2 where AI confirms code compiles/runs before proceeding
**Do NOT use**: Test, Validation (when referring to these specific checkpoints)

### Approval
**Official term**: Approval (in context of Phase 1.7)
**Usage**: "Phase 1.7: APPROVAL"
**Definition**: Final subphase of planning where user explicitly approves plan with "GO"
**Do NOT use**: Approval Gate, Final Approval, Sign-off

---

## SEAL Learning Terms

### SEAL
**Official term**: SEAL (all caps)
**Full name**: Self-Adapting LLM
**Usage**: "the SEAL engine", "SEAL learning", "SEAL patterns"
**Do NOT use**: Seal, S.E.A.L., seal

### Learning Loop
**Official term**: Learning Loop
**Definition**: The cycle of Task → Execute → Rate → Extract Patterns → Apply → Improve
**Do NOT use**: Assessment Loop, Feedback Loop, Learning Cycle (use "loop" not "cycle")

### SEAL Learning Stage
**Official term**: Stage (when referring to SEAL's learning development)
**Important**: This is DIFFERENT from Workflow Phases
**Context**: "Stage 1: Data Collection" (within SEAL Learning section)
**Usage**: Use "Stage" for SEAL learning, "Phase" for Workflow only

**The 3 SEAL Learning Stages**:
- Stage 1: Data Collection (Tasks 1-5)
- Stage 2: Pattern Emergence (Tasks 6-15)
- Stage 3: Automatic Application (Tasks 16+)

**Do NOT use**: "SEAL Phase", "Learning Phase" (these conflict with Workflow Phases)

### Pattern
**Official term**: Pattern (capitalized in titles, lowercase in text)
**Usage**: "Triage Pattern", "learned pattern", "applying patterns"
**Definition**: A learned approach/preference stored in PROJECT-STATE.md
**Do NOT use**: Operational Pattern, SEAL Pattern (just "pattern" is sufficient)

**Pattern Types** (always lowercase except in section titles):
- Triage Patterns (Section 5.B.1)
- Discovery Patterns (Section 5.B.2)
- Research Patterns (Section 5.B.3)
- Architecture Preferences (Section 5.B.4)
- Coding Style Patterns (Section 5.B.5)
- Testing Preferences (Section 5.B.6)
- Documentation Preferences (Section 5.B.7)
- UI Patterns (Section 5.B.8)
- Dummy Data Preferences (Section 5.B.9)

### Pattern Confidence
**Official term**: Pattern Confidence (or "confidence" in context)
**Usage**: "Pattern confidence: 0.88", "confidence score", "confidence level"
**Definition**: Numerical score (0.0-1.0) indicating reliability of a pattern
**Do NOT use**: Confidence Level (as primary term), Reliability Score, Trust Score

**Confidence Tiers**:
- Experimental: 0.0 - 0.50
- Emerging: 0.50 - 0.70
- Reliable: 0.70 - 0.85
- Best Practice: 0.85 - 0.95
- Project Standard: 0.95 - 1.0

---

## Documentation Terms

### PROJECT-STATE.md
**Official term**: PROJECT-STATE.md (all caps, with file extension)
**Full path**: `.vibecoding/PROJECT-STATE.md`
**Usage**: When providing instructions, use full path; when referencing in text, can use just "PROJECT-STATE.md"
**Do NOT use**: Project State, project-state, ProjectState

### Task Log
**Official term**: Task Log
**Location**: PROJECT-STATE.md Section 2
**Definition**: Sequential record of all tasks completed
**Do NOT use**: Execution Log, Task History, Activity Log

### Task
**Official term**: Task (capitalized when referring to specific task)
**Usage**: "Task #1", "Task #5", "current task"
**Format**: "Task #[number]: [description]"
**Do NOT use**: Job, Activity, Work Item

---

## Philosophy Terms

### Keep It Boring
**Official term**: Keep It Boring (capitalized)
**Usage**: Name of a core principle
**Definition**: Prefer simple, established tech over complex, experimental solutions
**Do NOT use**: Keep it boring, Keep-It-Boring, KIB

### Junior Dev Rule
**Official term**: Junior Dev Rule (capitalized)
**Usage**: Name of a core principle
**Definition**: All code must be readable by a junior developer
**Do NOT use**: Junior Developer Rule, JuniorDev Rule, Junior Dev Principle

### Methodical Over Fast
**Official term**: Methodical Over Fast (capitalized)
**Usage**: Name of a core principle
**Definition**: Quality through careful process trumps speed
**Do NOT use**: Methodical-Over-Fast, Quality Over Speed

---

## Code Quality Terms

### Boring Code
**Official term**: Boring code (lowercase)
**Definition**: Simple, established, easy-to-understand code
**Opposite**: Clever code (also lowercase)
**Do NOT use**: Simple code, Basic code (use "boring" specifically)

### Clever Code
**Official term**: Clever code (lowercase)
**Definition**: Complex, abstract, hard-to-understand code (forbidden)
**Do NOT use**: Complex code, Advanced code (use "clever" specifically)

### Explicit > DRY
**Official term**: Explicit > DRY
**Usage**: Principle name (keep this exact format with >)
**Definition**: Prefer repeated explicit code over complex abstractions
**Do NOT use**: Explicit Over DRY, Explicit vs DRY

---

## File References

### File Naming
When referencing Vibecoding OS core files, use these exact names:
- `00-core-philosophy.md`
- `01-workflow-protocol.md`
- `02-seal-engine.md`
- `03-constraints-quality.md`
- `04-ai-instructions.md`
- `templates/PROJECT-STATE.md` (template)
- `.vibecoding/PROJECT-STATE.md` (in user's project)

### Section References
**Official format**: "Section X.Y" or "Section X"
**Examples**:
- "Section 5.B" (patterns section)
- "Section 5.B.2" (discovery patterns)
- "Section 2" (task log)

**In cross-references**:
- "See Section 03-2.1" (file number + section)
- "See 02-seal-engine.md Section 3"

---

## Terminology to AVOID

These terms should NOT be used as they're not part of the official system:

❌ **Approval Gate** → Use: Stop & Wait (or Approval for Phase 1.7)
❌ **Stage** → Use: Phase
❌ **Operational Pattern** → Use: Pattern
❌ **SEAL Pattern** → Use: Pattern (or specify type like "Triage Pattern")
❌ **Execution Log** → Use: Task Log
❌ **Assessment Loop** → Use: Learning Loop
❌ **Feedback Loop** → Use: Learning Loop
❌ **Work Item** → Use: Task
❌ **Simple Code** → Use: Boring Code
❌ **Complex Code** → Use: Clever Code
❌ **Substage** → Use: Subphase
❌ **Wait Point** → Use: Stop & Wait

---

## Usage Examples

### Correct Usage:
```markdown
"In Phase 1.2 (Research), follow Step 3 to check learned patterns."

"Stage 2 of SEAL learning begins at Task 6, when patterns start emerging."

"Update pattern confidence in PROJECT-STATE.md Section 5.B.2."

"The Keep It Boring principle requires using established libraries."

"This code violates the Junior Dev Rule - it's too clever."

"At Phase 1.3, STOP & WAIT for user to choose an approach."
```

### Incorrect Usage:
```markdown
❌ "In Stage 1.2 (Research)..."
✅ "In Phase 1.2 (Research)..."

❌ "SEAL Learning Phase 2..." or "Phase 2 of SEAL..."
✅ "Stage 2 of SEAL learning..." or "SEAL Learning Stage 2..."

❌ "Update the execution log..."
✅ "Update the Task Log..."

❌ "This is an operational pattern..."
✅ "This is a pattern..." or "This is a Triage Pattern..."

❌ "At the approval gate..."
✅ "At Phase 1.7 (Approval)..." or "STOP & WAIT..."
```

---

## Capitalization Rules

### Always Capitalize:
- Phase (when referring to specific workflow phase: "Phase 1")
- Subphase (when used as a term)
- Task (when referring to specific task: "Task #5")
- Stage (when referring to SEAL learning stage: "Stage 1")
- SEAL (always all caps)
- Keep It Boring (principle name)
- Junior Dev Rule (principle name)
- Methodical Over Fast (principle name)
- Vibecoder (noun)
- Vibecoding OS (system name)
- PROJECT-STATE.md (file name)

### Lowercase in General Text:
- pattern (except in titles)
- confidence (except in titles)
- boring code
- clever code
- subphase (when used generically)

### All Caps (Emphasis):
- STOP & WAIT (in workflow instructions)
- SEAL (always)
- TRIAGE, DISCOVERY, RESEARCH, etc. (phase names in workflow headings)

---

## Standardization Checklist

When writing or editing Vibecoding OS documentation:

- [ ] All workflow phases called "Phase" (Phase 0-4), never "Stage"
- [ ] SEAL learning stages called "Stage" (Stage 1-3), never "Phase"
- [ ] Checkpoints called "Stop & Wait" or "Check", not "Approval Gate"
- [ ] Patterns never called "Operational Patterns" or "SEAL Patterns"
- [ ] Task log never called "Execution Log"
- [ ] Learning Loop never called "Assessment Loop" or "Feedback Loop"
- [ ] File references use exact names from this glossary
- [ ] Section references use "Section X.Y" format
- [ ] Core principles use official capitalized names
- [ ] "Boring code" and "clever code" used (not simple/complex)

---

## Version History

**v1.0** (2025-01-21)
- Initial glossary created
- Standardized all terms across Vibecoding OS v1.0
- Identified and resolved terminology inconsistencies

---

**This glossary is the authoritative source for all terminology in Vibecoding OS.**

When in doubt, refer to this document.
