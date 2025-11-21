# Claude Code Integration for Vibecoding OS

**Supercharge Vibecoding OS with Claude Code-specific features: slash commands, specialized sub-agents, and CLI tools.**

This integration transforms Vibecoding OS from a documentation system into a deeply integrated, automated workflow within Claude Code.

---

## What This Adds

### Without Integration (Core Only)
You manually tell Claude:
- "Load vibecoding-os/ files"
- "Follow the workflow protocol"
- "Update PROJECT-STATE.md"

### With Claude Code Integration
Claude automates everything:
- Type `/vibecoding` → Entire system loads instantly
- Type `/triage "add login"` → Instant classification
- Specialized agents handle each phase automatically
- CLI tools validate code without opening AI chat

---

## Features

### 1. ⚡ Slash Commands

**Instant workflow activation - no more typing paragraphs:**

| Command | What It Does |
|---------|--------------|
| `/vibecoding` | Load entire system + PROJECT-STATE.md |
| `/triage [request]` | Classify as TRIVIAL or COMPLEX |
| `/seal` | View all learned patterns with confidence scores |
| `/phase [number]` | Show details about a specific workflow phase |
| `/spawn [agent]` | Launch specialized sub-agent for a phase |

**Example:**
```
You: /vibecoding
Claude: [Loads all core files and PROJECT-STATE.md]
        Vibecoding OS loaded. Ready for next task.

You: /triage I need a contact form
Claude: Phase 0: TRIAGE - Classification: COMPLEX
        Next Step: Initiate Phase 1 (Planning)
```

### 2. 🤖 Specialized Sub-Agents

**Phase-specific AI experts with focused context:**

| Agent | Phase | Specialization |
|-------|-------|----------------|
| **PLANNER** | Phase 1 | Discovery, Research, Brainstorm, Specification |
| **BUILDER** | Phase 2 | Scaffolding, Connectivity, Core Logic, UI Binding |
| **TESTER** | Phase 3 | Manual Walkthrough, Edge Cases, Fixes |
| **SEAL** | Phase 4.3 | Pattern Extraction, Confidence Updates |

**Benefits:**
- Each agent only loads relevant files (50-100KB vs full project)
- Specialized instructions per phase
- Consistent phase rule enforcement
- Better pattern learning

**Example:**
```
You: /spawn planner Create a login form with email/password
PLANNER: [Conducts Phase 1.1-1.7, STOP & WAIT after each]
         [Returns complete specification]

You: GO

You: /spawn builder [specification]
BUILDER: [Implements Phase 2.1-2.4 step-by-step]
         [Returns working code]
```

### 3. 🛠️ CLI Tools

**Command-line validation and status checks:**

```bash
# Check project status
./scripts/claude-vibecoding status

# Validate code quality
./scripts/claude-vibecoding validate src/components/LoginForm.tsx

# View learned patterns
./scripts/claude-vibecoding patterns

# Triage a request
./scripts/claude-vibecoding triage "Add user authentication"

# View phase details
./scripts/claude-vibecoding phase 1.2
```

**Perfect for:**
- Quick code validation before commits
- Status checks without opening AI chat
- Pattern reviews during breaks
- Pre-commit quality gates

---

## Installation

**Full setup takes 15-30 minutes** (depending on which features you want)

### Quick Start (Slash Commands Only - 10 minutes)

```bash
# From your project root
cp -r path/to/vibecoding-os/integrations/claude-code/commands/ ./.claude/commands/

# Done! Slash commands now available in Claude Code
```

Try it:
```
/vibecoding
```

### Full Installation (All Features)

**See [SETUP-GUIDE.md](SETUP-GUIDE.md) for complete instructions.**

Includes:
- ✅ Level 1: Slash Commands (10 min)
- ✅ Level 2: Sub-Agents (30 min)
- ✅ Level 3: CLI Tools (15 min)
- ⚠️ Level 4: MCP Servers (Advanced, 1-2 hours)

---

## Quick Examples

### Example 1: Load System and Start Task

```
You: /vibecoding
Claude: [Loads core files and PROJECT-STATE]
        Current status: 8 tasks completed, 88% success rate
        Vibecoding OS loaded. Ready for next task.

You: I need a contact form
Claude: Phase 0: TRIAGE - Classification: COMPLEX
        Initiating Phase 1 (Planning)...
```

### Example 2: Use Sub-Agents for Complex Task

```
You: /vibecoding
Claude: [System loaded]

You: /triage Add user authentication with email/password
Claude: Classification: COMPLEX
        Next: Initiate Phase 1 (Planning)

You: /spawn planner Add authentication: email/password, JWT tokens, protect routes
PLANNER: Phase 1.1: DISCOVERY
         [Asks outcome-focused questions]
         ⏸️ Waiting for confirmation to proceed.

You: [Answer questions]
PLANNER: [Proceeds through phases 1.2-1.7]
         Type 'GO' to start Phase 2 (Coding).

You: GO

You: /spawn builder [specification from PLANNER]
BUILDER: Phase 2.1: SCAFFOLDING
         [Creates file structure]
         [Checks after each subphase]

[Builder completes all subphases]

You: /spawn tester Authentication implemented per spec
TESTER: [Creates test steps]

You: [Tests and reports results]

You: /spawn seal Task completed, rating 5/5
SEAL: [Updates patterns in PROJECT-STATE.md]
      Pattern Updates:
      - Architecture Preferences: Confidence 0.70 → 0.75
      - Coding Style: Confidence 0.80 → 0.85
      Ready for next task.
```

### Example 3: Quick Validation with CLI

```bash
# Before committing code
$ ./scripts/claude-vibecoding validate src/components/LoginForm.tsx

Code Quality Check
==================
File: src/components/LoginForm.tsx

✓ No console.log statements
✓ No TODO/FIXME comments
✓ No 'var' usage (using const/let)
✗ Empty catch blocks found (handle errors properly)

Summary: 3 passed, 1 failed

Review and fix issues before marking task complete.
```

---

## Directory Structure

After installation:

```
your-project/
├── .claude/                          # Claude Code integration
│   ├── commands/                     # Slash commands
│   │   ├── vibecoding.md
│   │   ├── triage.md
│   │   ├── seal.md
│   │   ├── phase.md
│   │   └── spawn.md
│   ├── agents/                       # Sub-agent configs
│   │   ├── planner.md
│   │   ├── builder.md
│   │   ├── tester.md
│   │   └── seal.md
│   ├── scripts/                      # CLI tools
│   │   ├── claude-vibecoding
│   │   └── claude-vibecoding.bat
│   └── SETUP-GUIDE.md
│
├── vibecoding-os/                    # Core system (from ../../core/)
│   ├── 00-core-philosophy.md
│   ├── 01-workflow-protocol.md
│   └── ...
│
└── .vibecoding/
    └── PROJECT-STATE.md              # Your project's memory
```

---

## Available Commands

### Slash Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `/vibecoding` | Load system | `/vibecoding` |
| `/triage` | Classify request | `/triage Add login form` |
| `/seal` | View patterns | `/seal` |
| `/phase` | Show phase info | `/phase 1.2` |
| `/spawn` | Launch sub-agent | `/spawn planner [task]` |

### CLI Commands

| Command | Purpose | Example |
|---------|---------|---------|
| `init` | Initialize PROJECT-STATE | `claude-vibecoding init` |
| `status` | Show project status | `claude-vibecoding status` |
| `patterns` | Show learned patterns | `claude-vibecoding patterns` |
| `validate` | Check code quality | `claude-vibecoding validate [file]` |
| `triage` | Classify request | `claude-vibecoding triage [request]` |
| `phase` | Show phase details | `claude-vibecoding phase 1.2` |
| `metrics` | Show success metrics | `claude-vibecoding metrics` |

---

## Benefits Over Core Only

| Feature | Core Only | With Claude Code Integration |
|---------|-----------|------------------------------|
| **Load system** | Type paragraph | Type `/vibecoding` |
| **Triage** | Manual classification | Type `/triage [request]` |
| **Phase execution** | One AI handles all | Specialized agents per phase |
| **Context usage** | 100,000+ tokens | 50-100KB per agent |
| **Code validation** | Ask AI to check | `./scripts/claude-vibecoding validate [file]` |
| **Pattern viewing** | Read PROJECT-STATE.md | Type `/seal` or `./scripts/claude-vibecoding patterns` |
| **Phase guidance** | Reference docs | Type `/phase [number]` |
| **Setup time per session** | 2-3 minutes | 5 seconds |

---

## Workflow Comparison

### Without Integration

```
You: "Load all files from vibecoding-os/ directory. Also load .vibecoding/PROJECT-STATE.md.
      Review the PROJECT-STATE and tell me the current status. I want to add a contact form
      with name, email, and message fields that sends to an API endpoint. Please classify
      this task and follow the appropriate workflow phases from 01-workflow-protocol.md."

Claude: [Reads files, processes, responds...]
        [Takes 30-60 seconds to load and process]
```

### With Integration

```
You: /vibecoding
Claude: [Instant load]

You: /triage Add contact form with name, email, message → API
Claude: Classification: COMPLEX - Initiating Phase 1

You: /spawn planner [task description]
PLANNER: [Specialized planning agent takes over]
```

**Time saved per session: 2-3 minutes**

**Over 30 tasks: ~90 minutes saved**

---

## Requirements

- **Claude Code** installed and working
- **Vibecoding OS Core** files (from `../../core/`)
- **PROJECT-STATE.md** initialized (from `../../templates/`)

Optional:
- **Node.js 18+** (for MCP servers)
- **Command-line access** (for CLI tools)

---

## Documentation

### Setup
- **[SETUP-GUIDE.md](SETUP-GUIDE.md)** - Complete installation guide (all levels)

### Core System (in `../../core/`)
- **[Quick Start](../../core/QUICK-START.md)** - Beginner's guide to Vibecoding OS
- **[Workflow Protocol](../../core/01-workflow-protocol.md)** - 5-phase workflow details
- **[SEAL Engine](../../core/02-seal-engine.md)** - How learning works
- **[Quality Constraints](../../core/03-constraints-quality.md)** - Code quality rules

### Reference
- **[System Flowchart](../../core/SYSTEM-FLOWCHART.md)** - Visual system overview
- **[Terminology Glossary](../../core/TERMINOLOGY-GLOSSARY.md)** - Official terms
- **[Appendices](../../core/APPENDICES.md)** - Detailed examples

---

## Troubleshooting

### Slash commands not working

**Problem:** `/vibecoding` doesn't load files

**Solutions:**
1. Check `.claude/commands/` directory exists
2. Verify `vibecoding.md` file is in that directory
3. Check file paths point to correct `../../core/` location
4. Restart Claude Code

---

### Sub-agents not spawning

**Problem:** `/spawn planner` doesn't work

**Solutions:**
1. Check `.claude/agents/` directory exists
2. Verify agent `.md` files are present
3. Check `/spawn` command exists in `.claude/commands/`
4. Verify agent file syntax is valid Markdown

---

### CLI scripts not executing

**Linux/Mac Problem:** `permission denied`

**Solution:**
```bash
chmod +x .claude/scripts/claude-vibecoding
```

**Windows Problem:** Can't find PROJECT-STATE.md

**Solution:**
1. Run `init` first: `.claude/scripts/claude-vibecoding.bat init`
2. Verify `.vibecoding/PROJECT-STATE.md` exists

---

## Support

- **Integration Issues**: [GitHub Issues](https://github.com/andrewtmouser-cell/vibecoding-os/issues)
- **General Vibecoding OS Help**: See [main README](../../README.md)
- **Claude Code Documentation**: [https://docs.anthropic.com/claude-code](https://docs.anthropic.com/claude-code)

---

## Contributing

Want to improve the Claude Code integration?

- Add new slash commands
- Enhance sub-agent instructions
- Add more CLI tools
- Improve setup documentation

Submit PRs to the main repository!

---

## License

MIT License - Same as Vibecoding OS core

---

**Ready to enhance your Vibecoding OS experience?**

👉 **[Start with SETUP-GUIDE.md](SETUP-GUIDE.md)** - Complete installation

👉 **[Learn Vibecoding OS Core](../../core/QUICK-START.md)** - If you're new to the system

👉 **[View All Integrations](../)** - See what else is available
