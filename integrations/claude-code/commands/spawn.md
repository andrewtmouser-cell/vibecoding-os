# Spawn Specialized Sub-Agent

Spawn a specialized sub-agent to handle a specific workflow phase with focused expertise.

---

## Usage

```
/spawn [agent-type] [task-description or context]
```

---

## Available Agents

### 1. `planner` - Phase 1 Specialist

**Handles:** Phase 1 (Planning) - Discovery through Approval

**When to use:**
- Task classified as COMPLEX in Phase 0
- Need to ask clarifying questions
- Need to research existing code
- Need to present architecture approaches
- Need to create implementation specification

**Example:**
```
/spawn planner Create a login form with email/password authentication
```

**What it does:**
- Conducts Phase 1.1 (Discovery) - Asks outcome-focused questions
- Conducts Phase 1.2 (Research) - Checks existing code patterns
- Conducts Phase 1.3 (Brainstorm) - Presents 3 approaches
- Conducts Phase 1.4 (Evaluation) - Scores and recommends
- Conducts Phase 1.5 (Premortem) - Identifies risks
- Conducts Phase 1.6 (Specification) - Creates implementation plan
- Conducts Phase 1.7 (Approval) - Waits for your "GO" signal

**What it returns:** Complete specification ready for Phase 2

---

### 2. `builder` - Phase 2 Specialist

**Handles:** Phase 2 (Coding) - Scaffolding through UI Binding

**When to use:**
- Phase 1 complete, specification approved
- Ready to start implementation
- Need code written following quality constraints

**Example:**
```
/spawn builder [paste specification from Phase 1.6]
```

**What it does:**
- Conducts Phase 2.1 (Scaffolding) - Creates file structure
- Conducts Phase 2.2 (Connectivity) - Tests with dummy data
- Conducts Phase 2.3 (Core Logic) - Implements features
- Conducts Phase 2.4 (UI Binding) - Adds loading/error states

**What it returns:** Complete implementation ready for testing

---

### 3. `tester` - Phase 3 Specialist

**Handles:** Phase 3 (Testing) - Manual walkthrough through fixes

**When to use:**
- Phase 2 complete, code implemented
- Ready to test functionality
- Need test plans created
- Need help fixing bugs

**Example:**
```
/spawn tester [paste code from Phase 2 or describe what was built]
```

**What it does:**
- Conducts Phase 3.1 (Manual Walkthrough) - Creates happy path tests
- Conducts Phase 3.2 (Edge Case Testing) - Tests Premortem risks
- Conducts Phase 3.3 (Fix & Verify) - Proposes fixes for failures

**What it returns:** Test results and verified bug fixes

---

### 4. `seal` - Phase 4.3 Specialist

**Handles:** Phase 4.3 (SEAL Learning) - Pattern extraction and updates

**When to use:**
- Phases 1-3 complete
- Ready to rate task and update patterns
- Want to improve AI for next task

**Example:**
```
/spawn seal Task completed with rating 5/5: Worked perfectly, no issues
```

**What it does:**
- Collects your rating (1-5) and feedback
- Extracts what worked/didn't work
- Updates pattern confidence scores
- Updates PROJECT-STATE.md with learnings

**What it returns:** Updated patterns and PROJECT-STATE.md

---

## Benefits of Using Sub-Agents

### 1. Specialized Expertise
Each agent focuses on one phase and does it extremely well:
- PLANNER asks better questions
- BUILDER writes cleaner code
- TESTER finds more bugs
- SEAL extracts better patterns

### 2. Reduced Context Windows
Instead of loading your entire project (100,000+ tokens):
- PLANNER: ~50,000 tokens (planning docs only)
- BUILDER: ~100,000 tokens (code only)
- TESTER: ~50,000 tokens (tests and fixes only)
- SEAL: ~30,000 tokens (patterns only)

More focused = better performance

### 3. Consistent Phase Rules
Each agent follows its phase rules perfectly:
- PLANNER always STOP & WAIT after each subphase
- BUILDER always follows Junior Dev Rule
- TESTER always bases tests on Premortem
- SEAL always updates confidence correctly

### 4. Parallel Processing
You can potentially run multiple agents in parallel:
- BUILDER working on Feature A
- TESTER testing Feature B
- SEAL learning from Feature C

---

## Workflow Example

**Complete task using sub-agents:**

```
Step 1: Triage (Main agent)
/vibecoding
/triage "Add contact form with name, email, message fields"

→ Classification: COMPLEX
→ Recommendation: Initiate Phase 1

---

Step 2: Planning (PLANNER agent)
/spawn planner Create contact form with name, email, message fields. Should send to API.

→ PLANNER conducts Phase 1.1-1.7
→ Asks questions
→ Researches code
→ Presents 3 approaches
→ Creates specification
→ Waits for "GO"

You review and say: "GO"

→ PLANNER returns complete specification

---

Step 3: Coding (BUILDER agent)
/spawn builder [paste specification from PLANNER]

→ BUILDER conducts Phase 2.1-2.4
→ Creates file structure
→ Tests connectivity
→ Implements logic
→ Adds UI polish

→ BUILDER returns completed code

---

Step 4: Testing (TESTER agent)
/spawn tester Contact form built with validation, API call to /api/contact

→ TESTER creates test steps
→ You test and report results
→ TESTER fixes any bugs
→ You verify fixes work

→ TESTER returns verified working code

---

Step 5: Learning (SEAL agent)
/spawn seal Task completed. Rating: 5/5. Form works perfectly, validation clear, API call smooth.

→ SEAL collects feedback
→ Updates pattern confidence
→ Updates PROJECT-STATE.md

→ SEAL returns updated patterns

---

Task Complete! 🎉
```

---

## When NOT to Use Sub-Agents

**Don't spawn a sub-agent if:**

1. **Task is TRIVIAL**: Just use main agent for simple changes
   ```
   ❌ /spawn builder Change button color to blue
   ✅ Just ask main agent: "Change button color to blue"
   ```

2. **Quick question**: Sub-agents are for executing phases, not answering questions
   ```
   ❌ /spawn planner What files should I check?
   ✅ Just ask main agent directly
   ```

3. **Already mid-phase**: Don't interrupt a phase in progress
   ```
   ❌ Main agent doing Phase 1.3 → /spawn planner
   ✅ Let main agent finish the phase
   ```

4. **Simple iteration**: For small tweaks, main agent is faster
   ```
   ❌ /spawn builder Change email field to required
   ✅ Just ask main agent to edit the code
   ```

---

## Agent Configuration

Sub-agents are configured in:
- `.claude/agents/planner.md` - PLANNER configuration
- `.claude/agents/builder.md` - BUILDER configuration
- `.claude/agents/tester.md` - TESTER configuration
- `.claude/agents/seal.md` - SEAL configuration

Each configuration defines:
- Files to load
- Rules to follow
- Phase-specific instructions
- Output format standards

---

## Troubleshooting

### Agent not spawning

**Problem:** `/spawn planner` does nothing

**Solutions:**
- Check that `.claude/agents/planner.md` exists
- Verify agent configuration is valid Markdown
- Ensure file paths in agent config are correct
- Try reloading Vibecoding OS: `/vibecoding`

### Agent has wrong context

**Problem:** BUILDER doesn't have specification

**Solutions:**
- Make sure you paste specification after `/spawn builder`
- Check that PLANNER completed Phase 1.7 (Approval)
- Verify specification is complete (file tree, data flow, steps)

### Agent skipping subphases

**Problem:** PLANNER jumping from 1.1 to 1.4

**Solutions:**
- Check agent configuration includes STOP & WAIT rules
- Verify `.claude/agents/planner.md` has all subphase instructions
- Remind agent: "Please complete all subphases and STOP & WAIT"

---

## Advanced Usage

### Chain Multiple Agents

```
# Complete workflow in one session
/vibecoding
/spawn planner [task]
[Review, approve with "GO"]
/spawn builder [specification]
[Test the code]
/spawn tester [test results]
[Verify fixes]
/spawn seal [rating and feedback]

# All phases complete!
```

### Switch Mid-Task

```
# If BUILDER gets stuck
/spawn tester [what was built so far]
[Get test results and see what's wrong]

# Return to BUILDER with fix guidance
/spawn builder [fix these specific issues]
```

### Reuse Agents

```
# Use PLANNER for multiple features
/spawn planner Feature A
[Complete Feature A]

/spawn planner Feature B
[Complete Feature B]

# Each gets fresh planning with updated patterns
```

---

## Summary

**Spawn Sub-Agents to:**
- ✅ Get specialized expertise per phase
- ✅ Reduce context window usage
- ✅ Enforce phase rules consistently
- ✅ Process multiple tasks in parallel

**Use Main Agent for:**
- ✅ TRIVIAL tasks
- ✅ Quick questions
- ✅ Small iterations
- ✅ Coordination between agents

**Command:**
```
/spawn [planner|builder|tester|seal] [task-description]
```

---

Ready to use specialized sub-agents for your Vibecoding workflow!
