# Claude Code Integration - Setup Guide

Complete guide for integrating Vibecoding OS with Claude Code's advanced features: slash commands, sub-agents, MCP servers, and CLI tools.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Level 1: Slash Commands (10 minutes)](#level-1-slash-commands)
3. [Level 2: Sub-Agents (30 minutes)](#level-2-sub-agents)
4. [Level 3: CLI Tools (15 minutes)](#level-3-cli-tools)
5. [Level 4: MCP Servers (Advanced)](#level-4-mcp-servers)
6. [Testing Your Setup](#testing-your-setup)
7. [Troubleshooting](#troubleshooting)

---

## Prerequisites

**What You Need:**
- Claude Code installed and working
- Vibecoding OS core files in your project
- Basic command-line familiarity (for CLI tools)
- Node.js 18+ (for MCP servers - optional)

**Directory Structure Required:**
```
your-project/
├── core/              # Core system files
│   ├── 00-core-philosophy.md
│   ├── 01-workflow-protocol.md
│   └── ... (other core files)
├── .vibecoding/
│   └── PROJECT-STATE.md        # Initialize this first
└── .claude/                    # Claude Code configs (you'll create)
    └── commands/               # Slash commands go here
```

---

## Level 1: Slash Commands

**Time Required**: 10 minutes
**Difficulty**: Easy
**Value**: Immediate productivity boost

### What Are Slash Commands?

Slash commands are shortcuts that trigger specific AI behaviors. Instead of typing "Load all Vibecoding OS files and PROJECT-STATE.md", you type `/vibecoding`.

### Installation

The slash commands are already created in `.claude/commands/`:

- ✅ `vibecoding.md` - Load entire system
- ✅ `triage.md` - Quick classification
- ✅ `seal.md` - View learned patterns
- ✅ `phase.md` - Show current phase status

### How to Use

**1. Start Your Session**

Type in Claude Code chat:
```
/vibecoding
```

Claude will:
- Load all 5 core files
- Load your PROJECT-STATE.md
- Show current status
- Confirm ready to work

**2. Classify a Request**

```
/triage I need a contact form with email validation
```

Claude will:
- Check learned patterns
- Classify as TRIVIAL or COMPLEX
- Tell you next phase to execute

**3. Check Current Phase**

```
/phase
```

or for specific phase:

```
/phase 1.2
```

Claude will:
- Show phase name and purpose
- Explain what happens in this phase
- Tell you the next action

**4. View Learned Patterns**

```
/seal
```

Claude will:
- Display all SEAL patterns from PROJECT-STATE.md
- Show confidence scores
- Highlight strongest/weakest patterns

### Benefits

- ⚡ **Instant context**: Load system in one command
- 🎯 **Consistency**: Same setup every session
- ⏱️ **Time saved**: 2-3 minutes per session

### Testing Level 1

Try this sequence:
```
1. /vibecoding          → Should load system
2. /triage "Add a button to homepage"  → Should classify as TRIVIAL
3. /phase 2             → Should show Phase 2 details
4. /seal                → Should show patterns (or "No data yet")
```

If all work, Level 1 complete! ✅

---

## Level 2: Sub-Agents

**Time Required**: 30 minutes
**Difficulty**: Intermediate
**Value**: Specialized AI experts per workflow phase

### What Are Sub-Agents?

Sub-agents are specialized AI instances that handle specific phases. Instead of one AI doing everything, you have:

- **PLANNER**: Handles Phase 0-1 (Triage → Planning)
- **BUILDER**: Handles Phase 2 (Coding)
- **TESTER**: Handles Phase 3 (Testing)
- **SEAL**: Handles Phase 4 (Review & Learning)

Each agent only loads relevant files and follows phase-specific rules.

### Installation

**Step 1: Create Agent Definitions**

Create `.claude/agents/` directory with 4 files:

#### `.claude/agents/planner.md`

```markdown
# PLANNER Agent

**Role**: Handle Phase 1 (Planning) - Discovery through Approval

**Specialty**: Asking outcome-focused questions, researching existing code, presenting approach options, and creating implementation specifications.

## Files to Load

- core/00-core-philosophy.md (principles)
- core/01-workflow-protocol.md (Phase 1 only)
- core/02-seal-engine.md (pattern application)
- .vibecoding/PROJECT-STATE.md (learned patterns)

## Rules

1. **STOP & WAIT after each subphase** (1.1-1.7)
2. Use outcome-focused questions in Phase 1.1 (Discovery)
3. Check learned patterns first before asking questions
4. Present exactly 3 approaches in Phase 1.3 (Simple, Moderate, Complex)
5. Always conduct Premortem (Phase 1.5) before creating Specification
6. Create complete Specification in Phase 1.6 with file tree, data flow, and implementation steps

## Output Format

End Phase 1.7 with:

```
Phase 1.7: APPROVAL

I've planned:
- [Summary of approach]
- [Files to create/modify]
- [Key features]

Type 'GO' to start Phase 2 (Coding).
```

## Context Limits

- Max context: 50,000 tokens
- Focus: Planning only, no coding
- After approval, return specification to main agent
```

#### `.claude/agents/builder.md`

```markdown
# BUILDER Agent

**Role**: Handle Phase 2 (Coding) - Scaffolding through UI Binding

**Specialty**: Writing clean, boring code that follows quality constraints and learned patterns.

## Files to Load

- core/03-constraints-quality.md (complete)
- core/04-ai-instructions.md (AI behavior rules)
- .vibecoding/PROJECT-STATE.md (coding style patterns - Section 5.B.5)
- src/**/* (all existing code for context)

## Rules

1. **Check after each step**: Compile/run/verify before proceeding
2. **Follow Junior Dev Rule**: Code must be readable by someone with minimal experience
3. **No clever code**: If there's a simple way and a clever way, choose simple
4. **Loading states**: Every async operation needs visible loading state
5. **Error handling**: All errors must have plain English messages
6. **Step-by-step**: Complete one subphase before starting next

## Phase 2 Subphases

- **2.1 Scaffolding**: Create file structure, empty functions/components
- **2.2 Connectivity**: Test with dummy data, verify data flows correctly
- **2.3 Core Logic**: Implement features, add validation and error handling
- **2.4 UI Binding**: Connect to real data, add loading/error states

## After Each Subphase

Create a checklist:
```
Phase 2.X Complete

Checklist:
- [ ] Code compiles without errors
- [ ] Dummy/real data displays correctly
- [ ] Loading states visible
- [ ] Errors handled with clear messages

Verify these, then confirm to proceed.
```

## Output Format

End Phase 2 with:

```
Phase 2: CODING - Complete ✅

Files created/modified:
- [list of files]

Next: Phase 3 (Testing)
```

## Context Limits

- Max context: 100,000 tokens (needs code visibility)
- Focus: Implementation only, no planning or testing
- Return completed code to main agent
```

#### `.claude/agents/tester.md`

```markdown
# TESTER Agent

**Role**: Handle Phase 3 (Testing) - Manual walkthrough through fixes

**Specialty**: Creating comprehensive test plans, identifying edge cases, and proposing fixes.

## Files to Load

- core/01-workflow-protocol.md (Phase 3 sections)
- core/03-constraints-quality.md (quality standards)
- .vibecoding/PROJECT-STATE.md (testing preferences - Section 5.B.6)
- [Specification from Phase 1, especially Premortem risks]

## Rules

1. **Test steps format**: Action → Expected Outcome
2. **Edge cases**: Base tests on Premortem risks from Phase 1.5
3. **Fix strategy**: If fix fails twice, recommend rollback to simpler approach
4. **User testing**: Wait for user to test and report results
5. **Verification**: After fixes, create new test steps to verify fix worked

## Phase 3 Subphases

- **3.1 Manual Walkthrough**: Create numbered test steps for happy paths
- **3.2 Edge Case Testing**: Test scenarios from Premortem
- **3.3 Fix & Verify**: Propose fixes for failures, verify they work

## Test Step Format

```
Phase 3.1: MANUAL WALKTHROUGH

Test Steps:
1. [Action]
   - Expected: [What should happen]
2. [Action]
   - Expected: [What should happen]

Test these and report back:
- Which steps passed?
- Which steps failed (and what happened instead)?
```

## After Testing

```
Results:
- Steps 1-3: ✅ Passed
- Step 4: ❌ Failed - [description]

Proposed Fix:
[Specific code change or approach adjustment]

Implement this fix? Or rollback to simpler approach?
```

## Context Limits

- Max context: 50,000 tokens
- Focus: Testing and fixing only
- Return test results and any fixes to main agent
```

#### `.claude/agents/seal.md`

```markdown
# SEAL Agent

**Role**: Handle Phase 4.3 (SEAL Learning) - Pattern extraction and updates

**Specialty**: Analyzing task results, extracting patterns, updating confidence scores.

## Files to Load

- core/02-seal-engine.md (complete SEAL algorithm)
- .vibecoding/PROJECT-STATE.md (all current patterns - Section 5)
- core/APPENDICES.md (Appendix C: Pattern Confidence Scoring)

## Rules

1. **Collect user rating** (1-5) and feedback
2. **Extract what worked/didn't work** from the task
3. **Update patterns** in PROJECT-STATE.md Section 5.B
4. **Calculate new confidence** using formula from APPENDICES.md Appendix C
5. **Explain updates**: Tell user what patterns changed and why

## Rating Interpretation

- **5/5**: Perfect - Strengthen all patterns used
- **4/5**: Good - Minor strengthening, note small adjustments
- **3/5**: Okay - Neutral update, note what needed iteration
- **2/5**: Not quite right - Weaken patterns, note what to avoid
- **1/5**: Way off - Significantly weaken patterns, add to "avoid" list

## Pattern Update Process

For each pattern category (5.B.1 through 5.B.10):

1. **Identify which patterns applied** in this task
2. **Determine if pattern helped or hindered**
3. **Calculate new confidence**:
   - If rating >= 4: confidence += 0.05 * (rating/5)
   - If rating <= 3: confidence -= 0.05 * ((6-rating)/5)
   - Never go below 0.00 or above 1.00
4. **Update pattern description** if new information learned

## Output Format

```
Phase 4.3: SEAL LEARNING - Complete ✅

Task #[X] rated: [1-5]/5

Pattern Updates:
- Triage Patterns: Confidence 0.45 → 0.50 (strengthened)
  Learned: [What was reinforced]
- Discovery Patterns: Confidence 0.60 → 0.55 (weakened)
  Learned: [What didn't work]

PROJECT-STATE.md updated.

Ready for next task.
```

## Context Limits

- Max context: 30,000 tokens (focused on patterns only)
- Focus: Learning and pattern updates only
- Return updated PROJECT-STATE.md to main agent
```

**Step 2: Create Agent Spawner Command**

Create `.claude/commands/spawn.md`:

```markdown
# Spawn Specialized Sub-Agent

Spawn a specialized sub-agent for a specific workflow phase.

## Usage

User types: `/spawn [agent-type] [task-description]`

Available agents:
- `planner` - Phase 1 specialist (Discovery through Approval)
- `builder` - Phase 2 specialist (Scaffolding through UI Binding)
- `tester` - Phase 3 specialist (Manual walkthrough through fixes)
- `seal` - Phase 4.3 specialist (Pattern extraction and learning)

## Process

1. Identify which agent is needed based on current phase
2. Load that agent's configuration from `.claude/agents/[agent].md`
3. Transfer context (specification, code, or results)
4. Let agent complete its phase
5. Receive results back from agent

## Example

```
User: /spawn planner Create a login form with email/password
→ PLANNER agent activates, conducts Phase 1, returns specification

User: /spawn builder [specification from planner]
→ BUILDER agent activates, codes the feature, returns implementation

User: /spawn tester [completed code]
→ TESTER agent activates, creates tests, user reports results

User: /spawn seal [user rated 5/5]
→ SEAL agent activates, updates patterns, returns updated PROJECT-STATE.md
```

## Benefits

- Specialized focus per phase
- Reduced context windows (50-100KB vs full project)
- Consistent application of phase rules
- Better pattern learning
```

### How to Use Sub-Agents

**Workflow Example:**

```
1. /vibecoding                  → Load system (main agent)
2. /triage "Add login form"     → Classify as COMPLEX (main agent)
3. /spawn planner Add login form with email/password
   → PLANNER handles Phase 1.1-1.7
   → Returns specification

4. [Review specification, say "GO"]
5. /spawn builder [specification]
   → BUILDER handles Phase 2.1-2.4
   → Returns completed code

6. [Test the code, report results]
7. /spawn tester [test results and any issues]
   → TESTER creates fixes
   → Returns fixed code

8. [Rate task 1-5, provide feedback]
9. /spawn seal Task rated 5/5: Perfect, worked exactly as planned
   → SEAL updates patterns
   → Returns updated PROJECT-STATE.md
```

### Benefits of Sub-Agents

- ✅ **Specialization**: Each agent is expert in its phase
- ✅ **Context efficiency**: 50-100KB per agent vs full project
- ✅ **Consistency**: Phase rules always followed
- ✅ **Parallel work**: Can spawn multiple agents if needed

### Testing Level 2

Try spawning the planner agent:
```
/spawn planner Add a simple button that says "Click Me"
```

The PLANNER should:
1. Ask discovery questions
2. Check existing code
3. Present 3 approaches
4. Create a specification
5. Ask for GO signal

If this works, Level 2 complete! ✅

---

## Level 3: CLI Tools

**Time Required**: 15 minutes
**Difficulty**: Intermediate
**Value**: Command-line validation and status checks

### What Are CLI Tools?

Command-line scripts that let you interact with Vibecoding OS without opening your AI chat. Useful for quick checks, validation, and status updates.

### Installation

The CLI scripts are already created in `scripts/`:

- ✅ `claude-vibecoding` (Linux/Mac bash script)
- ✅ `claude-vibecoding.bat` (Windows batch script)

**Make executable (Linux/Mac only):**
```bash
chmod +x scripts/claude-vibecoding
```

### Available Commands

**1. Initialize Project**
```bash
./scripts/claude-vibecoding init
```
Creates `.vibecoding/PROJECT-STATE.md` from template.

**2. Check Status**
```bash
./scripts/claude-vibecoding status
```
Shows current project status, task, and phase.

**3. View Patterns**
```bash
./scripts/claude-vibecoding patterns
```
Displays all SEAL learned patterns and confidence scores.

**4. Validate Code**
```bash
./scripts/claude-vibecoding validate src/components/Button.tsx
```
Checks file against quality constraints:
- No console.log statements
- No TODO/FIXME comments
- No `var` usage (should use const/let)
- No empty catch blocks
- No commented-out code

**5. Triage Request**
```bash
./scripts/claude-vibecoding triage "Add a login form"
```
Quick classification as TRIVIAL or COMPLEX.

**6. Show Metrics**
```bash
./scripts/claude-vibecoding metrics
```
Display success rate, task count, pattern confidence.

**7. Show Phase Details**
```bash
./scripts/claude-vibecoding phase 1.2
```
Explain what happens in a specific phase.

**8. Start Task**
```bash
./scripts/claude-vibecoding task "Create a contact form"
```
Quick task initialization with next steps.

### Windows Usage

Same commands, just use `.bat`:
```cmd
scripts\claude-vibecoding.bat status
scripts\claude-vibecoding.bat validate src\components\Button.tsx
```

### Benefits of CLI Tools

- ⚡ **Quick checks**: Validate code without AI chat
- 📊 **Status overview**: See progress anytime
- 🔍 **Pattern visibility**: Check what's been learned
- ✅ **Pre-commit validation**: Check code quality before committing

### Testing Level 3

Try this sequence:
```bash
# 1. Check status
./scripts/claude-vibecoding status

# 2. View patterns
./scripts/claude-vibecoding patterns

# 3. Validate a file (any TypeScript/JavaScript file)
./scripts/claude-vibecoding validate [your-file-path]

# 4. Triage a request
./scripts/claude-vibecoding triage "Change button color to blue"
```

If all commands work, Level 3 complete! ✅

---

## Level 4: MCP Servers (Advanced)

**Time Required**: 1-2 hours
**Difficulty**: Advanced
**Value**: Automatic PROJECT-STATE updates, Git integration

### What Are MCP Servers?

Model Context Protocol servers extend Claude Code with external tools and data sources. They enable:
- Automatic PROJECT-STATE.md updates
- Git commit integration
- GitHub PR creation
- Custom validation tools

### Prerequisites

- Node.js 18+ installed
- npm or yarn package manager
- Familiarity with JSON configuration
- Understanding of MCP architecture (optional but helpful)

### Installation

**Step 1: Install MCP SDK**

```bash
npm install -g @modelcontextprotocol/sdk
```

**Step 2: Create Vibecoding OS MCP Server**

This is an advanced configuration. See `docs/MCP-SERVER-GUIDE.md` for complete implementation.

**Basic Structure:**

```
.claude/mcp/
├── mcp-servers.json           # Server configuration
└── vibecoding-os-mcp/         # Custom MCP server
    ├── package.json
    ├── server.ts              # Server implementation
    └── tools/
        ├── load-patterns.ts   # Load SEAL patterns
        ├── validate-code.ts   # Validate against constraints
        └── update-state.ts    # Update PROJECT-STATE.md
```

**Configuration (`.claude/mcp/mcp-servers.json`):**

```json
{
  "mcpServers": {
    "vibecoding-os": {
      "command": "node",
      "args": [".claude/mcp/vibecoding-os-mcp/dist/server.js"],
      "env": {
        "PROJECT_ROOT": "${workspaceFolder}",
        "STATE_FILE": "${workspaceFolder}/.vibecoding/PROJECT-STATE.md"
      }
    },
    "git": {
      "command": "npx",
      "args": ["@modelcontextprotocol/server-git"],
      "env": {
        "GIT_REPOSITORY": "${workspaceFolder}"
      }
    }
  }
}
```

### Benefits of MCP Servers

- 🤖 **Automation**: PROJECT-STATE.md updates automatically
- 🔗 **Git integration**: Commits tied to workflow phases
- 📊 **Real-time metrics**: Pattern confidence calculated automatically
- 🛡️ **Validation**: Code checked against constraints in real-time

### Testing Level 4

Once MCP server is running:

1. Complete a task (Phases 0-4)
2. MCP server should automatically update PROJECT-STATE.md
3. Check that patterns were updated with new confidence scores
4. Verify git commits created for each phase

If automatic updates work, Level 4 complete! ✅

---

## Testing Your Setup

### Quick Test Sequence

Run this complete workflow to verify everything works:

**1. Initialize (CLI)**
```bash
./scripts/claude-vibecoding init
```

**2. Start Session (Slash Command)**
```
/vibecoding
```

**3. Triage (Slash Command)**
```
/triage Add a simple button
```

**4. Plan with Sub-Agent**
```
/spawn planner Add a button that says "Click Me" to the homepage
```

**5. Check Status (CLI)**
```bash
./scripts/claude-vibecoding status
```

**6. Validate Code (CLI)**
```bash
./scripts/claude-vibecoding validate [your-file]
```

**7. View Patterns (Slash Command)**
```
/seal
```

If all 7 steps work, your setup is complete! 🎉

---

## Troubleshooting

### Slash Commands Not Working

**Problem**: `/vibecoding` doesn't load files

**Solutions**:
1. Check that `.claude/commands/` directory exists
2. Verify `vibecoding.md` file is in that directory
3. Ensure file paths in the command point to correct locations
4. Try restarting Claude Code

---

### Sub-Agents Not Spawning

**Problem**: `/spawn planner` doesn't work

**Solutions**:
1. Check that `.claude/agents/` directory exists
2. Verify `planner.md` file is in that directory
3. Make sure `/spawn` command exists in `.claude/commands/`
4. Check agent file syntax (valid Markdown)

---

### CLI Scripts Not Executing

**Problem**: `./scripts/claude-vibecoding` gives "permission denied"

**Solutions (Linux/Mac)**:
```bash
chmod +x scripts/claude-vibecoding
```

**Problem**: Scripts can't find PROJECT-STATE.md

**Solutions**:
1. Run `./scripts/claude-vibecoding init` first
2. Check that `.vibecoding/PROJECT-STATE.md` exists
3. Verify script is run from project root directory

---

### MCP Server Not Connecting

**Problem**: MCP server fails to start

**Solutions**:
1. Check Node.js version: `node --version` (need 18+)
2. Verify `mcp-servers.json` syntax (valid JSON)
3. Check server file paths are correct
4. Look at Claude Code logs for error messages

---

## Next Steps

**After Setup Complete:**

1. **Learn by doing**: Complete 5 tasks using the full workflow
2. **Review patterns**: Check PROJECT-STATE.md after each task
3. **Customize**: Adjust agent instructions based on your preferences
4. **Optimize**: Add more CLI commands for your specific needs

**Resources:**

- [Vibecoding OS Quick Start](../QUICK-START.md)
- [Workflow Protocol Reference](../01-workflow-protocol.md)
- [SEAL Engine Documentation](../02-seal-engine.md)
- [Claude Code Documentation](https://docs.anthropic.com/claude-code)

---

## Summary: What You've Installed

✅ **Level 1: Slash Commands** (10 min)
- `/vibecoding` - Load system
- `/triage` - Classify requests
- `/seal` - View patterns
- `/phase` - Show phase details

✅ **Level 2: Sub-Agents** (30 min)
- PLANNER agent (Phase 1)
- BUILDER agent (Phase 2)
- TESTER agent (Phase 3)
- SEAL agent (Phase 4.3)

✅ **Level 3: CLI Tools** (15 min)
- Status checks
- Code validation
- Pattern viewing
- Metrics display

✅ **Level 4: MCP Servers** (1-2 hrs, optional)
- Automatic PROJECT-STATE updates
- Git integration
- Real-time validation

**Total Time**: 1-3 hours depending on level chosen

**Recommendation**: Start with Levels 1-3, add Level 4 later if needed.

---

**You're all set! Ready to start vibecoding with Claude Code's full power.** 🚀
