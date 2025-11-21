# Vibecoding OS - Cross-Reference Map

**Purpose**: Define where each file should reference other files to create a cohesive, integrated system.

**Date Created**: 2025-01-21
**Status**: Blueprint for integration rewrite

---

## Overview

Currently, files operate in isolation. This map defines explicit cross-references to integrate the system.

### The Integration Problem

**ChatGPT's Feedback**:
- Workflow Protocol doesn't reference SEAL directly
- SEAL doesn't mention the Constraints file
- AI Instructions repeat things from Constraints
- Success Metrics appear in Philosophy but not used later
- Patterns are mentioned in Workflow but not explicitly linked to SEAL's pattern format

**Solution**: Add explicit cross-references where concepts connect.

---

## File-by-File Cross-Reference Requirements

### 00-core-philosophy.md

**Current State**: Introduces concepts but doesn't point to where they're implemented

**Required Cross-References**:

1. **In "The SEAL Learning Engine" section** (line ~98):
   ```markdown
   For full SEAL implementation details, see 02-seal-engine.md.
   For how AI should apply SEAL, see 04-ai-instructions.md Section: Rule 7.
   ```

2. **In "The Workflow Protocol" section** (line ~165):
   ```markdown
   This is a high-level overview. For detailed workflow instructions, see 01-workflow-protocol.md.
   ```

3. **In "The Quality Guardrails" section** (line ~209):
   ```markdown
   These principles are enforced through rules in 03-constraints-quality.md.
   ```

4. **In "Success Metrics" section** (line ~244):
   ```markdown
   Track these metrics in PROJECT-STATE.md Section 8.
   SEAL updates these automatically during Phase 4.3 (see 02-seal-engine.md Section: SEAL Update Protocol).
   ```

5. **In "When to Break the Rules" section** (line ~277):
   ```markdown
   Document rule breaks in Phase 1.6 (Specification) per 01-workflow-protocol.md.
   Log deviations in PROJECT-STATE.md Section 9: Important Decisions.
   ```

**Tone Check**: Currently philosophical/inspirational - this is CORRECT. Keep it.

---

### 01-workflow-protocol.md

**Current State**: Detailed procedural steps but doesn't reference SEAL or constraints

**Required Cross-References**:

1. **At the top** (after line 3):
   ```markdown
   **Foundation**: This workflow implements the principles from 00-core-philosophy.md.
   **Quality Rules**: All work must follow constraints in 03-constraints-quality.md.
   **Learning System**: SEAL updates occur at specific points (see 02-seal-engine.md).
   ```

2. **In Phase 0, Step 2** (line ~31):
   ```markdown
   Check SEAL patterns for this task type (see 02-seal-engine.md Section: Pattern Application).
   ```

3. **In Phase 0, Step 4** (line ~56):
   ```markdown
   Update PROJECT-STATE.md Section 2 (Task Log) with this entry.
   ```

4. **In Phase 1.1 (Discovery), Step 1** (line ~86):
   ```markdown
   Check PROJECT-STATE.md Section 5.B.2: Discovery Patterns.
   Apply learned questioning patterns (see 02-seal-engine.md Section: What SEAL Learns).
   ```

5. **In Phase 1.2 (Research), Step 1** (line ~140):
   ```markdown
   Check PROJECT-STATE.md Section 5.B.3: Research Patterns.
   Check PROJECT-STATE.md Section 5.C: Project Structure Map.
   ```

6. **In Phase 1.3 (Brainstorm), Step 1** (line ~196):
   ```markdown
   Check PROJECT-STATE.md Section 5.B.4: Architecture Preferences.
   Remember "Keep It Boring" principle from 00-core-philosophy.md.
   ```

7. **In Phase 1.4 (Evaluation)** (line ~249):
   ```markdown
   Evaluation criteria based on 00-core-philosophy.md principles:
   - Simplicity = "Junior Dev Rule"
   - Reliability = "Methodical Over Fast"
   - Vibecodability = "Keep It Boring"
   ```

8. **In Phase 1.5 (Premortem), Step 1** (line ~297):
   ```markdown
   Check PROJECT-STATE.md Section 6: Actual Risks Encountered.
   Prioritize risks that ACTUALLY happened in this project, not theoretical risks.
   ```

9. **In Phase 2.1 (Scaffolding), Step 1** (line ~462):
   ```markdown
   Check PROJECT-STATE.md Section 5.B.5: Coding Style Patterns.
   Check PROJECT-STATE.md Section 5.C: Project Structure Map.
   All code must follow 03-constraints-quality.md rules.
   ```

10. **In Phase 2.2 (Connectivity), Step 1** (line ~521):
    ```markdown
    Check PROJECT-STATE.md Section 5.B.9: Dummy Data Preferences.
    ```

11. **In Phase 2.3 (Core Logic), Step 1** (line ~586):
    ```markdown
    Check PROJECT-STATE.md Section 5.B.5: Coding Style Patterns.
    Follow all coding constraints from 03-constraints-quality.md Section: Coding Constraints.
    ```

12. **In Phase 2.4 (UI Binding), Step 1** (line ~648):
    ```markdown
    Check PROJECT-STATE.md Section 5.B.8: UI Patterns.
    Follow error handling rules from 03-constraints-quality.md Sections 6-8.
    ```

13. **In Phase 3.1 (Manual Walkthrough), Step 1** (line ~769):
    ```markdown
    Check PROJECT-STATE.md Section 5.B.6: Testing Preferences.
    ```

14. **In Phase 3.2 (Edge Case Assault), Step 1** (line ~822):
    ```markdown
    Check PROJECT-STATE.md Section 6: Actual Risks Encountered.
    Reference Phase 1.5 Premortem risks from earlier in this task.
    ```

15. **In Phase 4.1 (Code Audit)** (line ~900):
    ```markdown
    Verify code passes all constraints from 03-constraints-quality.md Section: Quality Checklist.
    ```

16. **In Phase 4.2 (Documentation), Step 1** (line ~947):
    ```markdown
    Check PROJECT-STATE.md Section 5.B.7: Documentation Preferences.
    ```

17. **In Phase 4.3 (SEAL Learning)** (line ~990):
    ```markdown
    **CRITICAL SEAL UPDATE POINT**

    This is where SEAL learning happens. Follow the complete protocol in 02-seal-engine.md Section: SEAL Update Protocol.

    Update all relevant sections of PROJECT-STATE.md:
    - Section 2: Task Log
    - Section 5.B: Patterns (see 02-seal-engine.md for pattern update rules)
    - Section 6: Issues/Risks (if applicable)
    - Section 8: Metrics
    ```

18. **In Workflow Summary** (bottom, line ~1100):
    ```markdown
    **System Integration**:
    - Philosophy principles: 00-core-philosophy.md
    - Quality rules: 03-constraints-quality.md
    - SEAL learning: 02-seal-engine.md
    - AI behavior: 04-ai-instructions.md
    - State tracking: PROJECT-STATE.md
    ```

**Tone Check**: Currently mixed - should be 100% procedural/imperative. Fix in rewrite.

---

### 02-seal-engine.md

**Current State**: Explains SEAL but doesn't connect to workflow or constraints

**Required Cross-References**:

1. **At the top** (after line 7):
   ```markdown
   **Integration**: SEAL activates during Phase 4.3 of the Workflow Protocol (see 01-workflow-protocol.md).
   **Storage**: All patterns stored in PROJECT-STATE.md Section 5.B.
   **Foundation**: SEAL implements the "self-improving" principle from 00-core-philosophy.md.
   ```

2. **In "The Learning Loop" section** (line ~14):
   ```markdown
   This loop executes in Phase 4.3 of every task (see 01-workflow-protocol.md Section: Phase 4.3).
   ```

3. **In "What SEAL Learns" - Each subsection** should reference where it applies:
   - **5.1 Triage Patterns** (line ~45): `Applied in Phase 0: Triage (see 01-workflow-protocol.md)`
   - **5.2 Discovery Patterns** (line ~65): `Applied in Phase 1.1: Discovery (see 01-workflow-protocol.md)`
   - **5.3 Research Patterns** (line ~94): `Applied in Phase 1.2: Research (see 01-workflow-protocol.md)`
   - **5.4 Architecture Preferences** (line ~118): `Applied in Phase 1.3: Brainstorm (see 01-workflow-protocol.md)`
   - **5.5 Coding Style Patterns** (line ~134): `Applied in Phase 2 subphases (see 01-workflow-protocol.md). Must conform to 03-constraints-quality.md.`
   - **5.6 Testing Preferences** (line ~160): `Applied in Phase 3: Testing (see 01-workflow-protocol.md)`
   - **5.7 Documentation Preferences** (line ~181): `Applied in Phase 4.2: Documentation (see 01-workflow-protocol.md)`

4. **In "Pattern Storage" section** (line ~286):
   ```markdown
   Patterns are stored in PROJECT-STATE.md Section 5.B using this format:
   [format details]
   ```

5. **In "SEAL Update Protocol" section** (line ~319):
   ```markdown
   **When**: After every task completion, in Phase 4.3 (see 01-workflow-protocol.md).
   **Where**: All updates go to PROJECT-STATE.md sections (see template in templates/PROJECT-STATE.md).
   ```

6. **In "Pattern Application" section** (line ~381):
   ```markdown
   **When to Check**: At the start of every workflow phase (see 01-workflow-protocol.md for specific checkpoints).
   **Constraints**: All patterns must comply with 03-constraints-quality.md rules.
   ```

7. **In "Meta-Patterns" section** (line ~434):
   ```markdown
   Meta-patterns are universal rules that apply across all phases (see 01-workflow-protocol.md for where to apply).
   ```

**Tone Check**: Currently instructional - this is CORRECT. Keep it.

---

### 03-constraints-quality.md

**Current State**: Lists rules but doesn't show where they're enforced

**Required Cross-References**:

1. **At the top** (after line 3):
   ```markdown
   **Foundation**: These constraints enforce the principles from 00-core-philosophy.md.
   **Enforcement**: AI must follow these per 04-ai-instructions.md Rule 6.
   **Application**: These rules apply during Phase 2 (Coding) and Phase 4.1 (Code Audit) per 01-workflow-protocol.md.
   ```

2. **In "No Clever Code" section** (line ~9):
   ```markdown
   This enforces the "Junior Dev Rule" from 00-core-philosophy.md.
   Verified in Phase 4.1: Code Audit (see 01-workflow-protocol.md).
   ```

3. **In "Explicit > DRY" section** (line ~35):
   ```markdown
   This enforces the "Junior Dev Rule" from 00-core-philosophy.md.
   ```

4. **In "Keep It Boring Architecture" section** (line ~100):
   ```markdown
   This enforces the "Keep It Boring" principle from 00-core-philosophy.md.
   Applied during Phase 1.3: Brainstorm and Phase 1.4: Evaluation (see 01-workflow-protocol.md).
   ```

5. **In "Phase Declaration" section** (line ~176):
   ```markdown
   Phase format defined in 01-workflow-protocol.md.
   AI must state phase per 04-ai-instructions.md Rule 2.
   ```

6. **In "All User Actions Must Have Error Handling" section** (line ~197):
   ```markdown
   Checked in Phase 4.1: Code Audit (see 01-workflow-protocol.md).
   ```

7. **In "Emergency Rules" - "If an Error Occurs" section** (line ~407):
   ```markdown
   This emergency protocol applies during Phase 2: Coding (see 01-workflow-protocol.md Section: Coding Emergency Rules).
   ```

8. **In "Quality Checklist" section** (line ~442):
   ```markdown
   **When to Use**: Phase 4.1: Code Audit (see 01-workflow-protocol.md).
   AI must complete this checklist before proceeding to Phase 4.2.
   ```

**Tone Check**: Currently rules/legal - this is CORRECT. Keep it.

---

### 04-ai-instructions.md

**Current State**: Some references but missing key connections

**Required Cross-References**:

1. **In "On First Load", Step 1** (line ~28):
   ```markdown
   Read all core files in order:
   1. 00-core-philosophy.md (understand principles)
   2. 01-workflow-protocol.md (understand process)
   3. 02-seal-engine.md (understand learning)
   4. 03-constraints-quality.md (understand rules)
   5. This file (04-ai-instructions.md)
   ```

2. **In "Rule 1: Always Follow the Workflow"** (line ~74):
   ```markdown
   The workflow is defined in 01-workflow-protocol.md.
   Never skip phases unless Phase 0 (Triage) determines task is TRIVIAL.
   ```

3. **In "Rule 2: Always State Current Phase"** (line ~91):
   ```markdown
   Phase names from 01-workflow-protocol.md.
   This is required by 03-constraints-quality.md Section 5.
   ```

4. **In "Rule 5: Update PROJECT-STATE.md Always"** (line ~151):
   ```markdown
   Follow the complete update protocol in 02-seal-engine.md Section: SEAL Update Protocol.
   This happens in Phase 4.3 (see 01-workflow-protocol.md).
   ```

5. **In "Rule 6: Follow All Constraints"** (line ~165):
   ```markdown
   All constraints defined in 03-constraints-quality.md.
   These enforce principles from 00-core-philosophy.md.
   ```

6. **In "Rule 7: Learn and Apply Patterns"** (line ~185):
   ```markdown
   Pattern system defined in 02-seal-engine.md.
   Patterns stored in PROJECT-STATE.md Section 5.B.
   Apply patterns at checkpoints defined in 01-workflow-protocol.md.
   ```

7. **In "Communication Guidelines"** (line ~206):
   ```markdown
   Non-technical language required by "Junior Dev Rule" from 00-core-philosophy.md.
   Examples of good communication in 03-constraints-quality.md Section 4.
   ```

8. **In "Error Recovery Protocol"** (line ~292):
   ```markdown
   Emergency rules from 03-constraints-quality.md Sections 14-15.
   Applies during Phase 2: Coding (see 01-workflow-protocol.md Section: Coding Emergency Rules).
   ```

9. **In "Quality Assurance"** (line ~325):
   ```markdown
   Quality checklist from 03-constraints-quality.md Section: Quality Checklist.
   Run during Phase 4.1: Code Audit (see 01-workflow-protocol.md).
   ```

10. **In "Context Window Management"** (line ~391):
    ```markdown
    Update all sections of PROJECT-STATE.md thoroughly.
    Follow SEAL Update Protocol from 02-seal-engine.md.
    ```

**Tone Check**: Currently operational/direct - this is CORRECT. Keep it.

---

### templates/PROJECT-STATE.md

**Current State**: Template exists but doesn't explain integration

**Required Cross-References**:

1. **At the very top** (after line 1):
   ```markdown
   **System Integration**: This file is the single source of truth for AI state.
   - Loaded at start of every session per 04-ai-instructions.md
   - Updated after every task per 01-workflow-protocol.md Phase 4.3
   - Pattern storage format defined in 02-seal-engine.md
   - Metrics tracked per 00-core-philosophy.md Section: Success Metrics
   ```

2. **In "HOW TO USE THIS FILE" - For AI section** (line ~410):
   ```markdown
   **At Start of Every Session**:
   1. Read this entire file per 04-ai-instructions.md Rule 5
   2. Load patterns from Section 5.B per 02-seal-engine.md Section: Pattern Application
   3. Check current task and phase from 01-workflow-protocol.md

   **After Every Completed Task**:
   1. Update per 01-workflow-protocol.md Phase 4.3
   2. Follow SEAL Update Protocol from 02-seal-engine.md
   3. Update metrics per 00-core-philosophy.md Section: Success Metrics
   ```

**Tone Check**: Currently instructional/reference - this is CORRECT. Keep it.

---

### README.md

**Current State**: Overview document, references system files

**Required Cross-References**:

1. **In "How It Works" section** (line ~67):
   ```markdown
   For complete workflow details, see 01-workflow-protocol.md.
   For learning system details, see 02-seal-engine.md.
   For quality rules, see 03-constraints-quality.md.
   ```

2. **In "Core Principles" section** (line ~136):
   ```markdown
   Full philosophy in 00-core-philosophy.md.
   ```

**Tone Check**: Currently marketing/explanatory - this is CORRECT. Keep it.

---

## Integration Priority

When rewriting files, integrate cross-references in this order:

### High Priority (Do First):
1. **01-workflow-protocol.md** - Backbone of system, needs most references
2. **02-seal-engine.md** - Needs to connect to workflow phases
3. **04-ai-instructions.md** - Needs to reference everything else

### Medium Priority (Do Second):
4. **00-core-philosophy.md** - Add "see also" pointers
5. **03-constraints-quality.md** - Connect to philosophy and workflow

### Low Priority (Do Last):
6. **PROJECT-STATE.md template** - Add usage instructions
7. **README.md** - Already has basic references

---

## Cross-Reference Format Standards

### Within Same File:
```markdown
See the section "Pattern Storage" below.
As described in Section 3.2 above.
```

### To Other System Files:
```markdown
See 01-workflow-protocol.md Section: Phase 2.1
Per 03-constraints-quality.md Section 6
Defined in 02-seal-engine.md
```

### To PROJECT-STATE.md:
```markdown
Check PROJECT-STATE.md Section 5.B.2
Update PROJECT-STATE.md Section 8
```

### To Multiple Related Sections:
```markdown
This principle appears in:
- 00-core-philosophy.md (defined)
- 01-workflow-protocol.md Phase 1.3 (applied)
- 03-constraints-quality.md Section 3 (enforced)
```

---

## Verification Checklist

After rewriting each file, verify:

- [ ] All concepts introduced point to where they're defined
- [ ] All processes reference the workflow phase where they occur
- [ ] All rules connect to the philosophy principle they enforce
- [ ] All SEAL references point to 02-seal-engine.md
- [ ] All PROJECT-STATE.md references include section numbers
- [ ] No circular references (A→B→A)
- [ ] No dead references (pointing to non-existent sections)

---

## Version History

**v1.0** (2025-01-21)
- Initial cross-reference map created
- Identified all missing integration points
- Defined standards for cross-references

---

**This map is the blueprint for the integration rewrite.**

Use it as a checklist when rewriting each file to ensure complete integration.
