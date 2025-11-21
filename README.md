# Vibecoding OS

**An "operating system" for AI coding that makes AI behavior consistent, methodical, and self-improving.**

Think of it as the structured framework that turns unreliable AI coding assistants into systematic, learning partners that get better at your projects over time.

---

## 🚀 Quick Start

**New to Vibecoding OS?** Start here:

👉 **[Quick Start Guide](core/QUICK-START.md)** - Get up and running in 10 minutes

**Using Claude Code?** Enhanced integration available:

👉 **[Claude Code Integration](integrations/claude-code/)** - Slash commands, sub-agents, CLI tools

---

## What's New

**Monorepo Refactor (2025)**:

🏗️ **Monorepo Structure** - Organized into core + integrations
- Platform-agnostic `core/` directory works with any AI
- Platform-specific `integrations/` for enhanced features
- Clear separation of concerns

🔌 **Claude Code Integration** - Deep integration with specialized features
- Slash commands: `/vibecoding`, `/triage`, `/seal`, `/phase`, `/spawn`
- Specialized sub-agents: PLANNER, BUILDER, TESTER, SEAL
- CLI tools for validation and status checks
- Complete setup guide with 4 levels

📚 **Enhanced Documentation** - Comprehensive guides added
- System flowchart with visual diagrams
- Terminology glossary with official definitions
- Cross-reference map showing file relationships
- Appendices with detailed examples

**Previous Features**:
- 🎯 PRP Builder for plain English specifications
- 🧪 Automated validation and testing
- 📊 Enhanced PROJECT-STATE tracking

> **Note**: Some previous features (PRP Builder, Automated Validation) may need updates to match the new monorepo structure. Contributions welcome!

---

## What Problem Does This Solve?

### Without Vibecoding OS:
- ❌ AI is inconsistent (different results each time)
- ❌ AI forgets what worked before
- ❌ No structure (AI wings it every time)
- ❌ Code quality varies wildly
- ❌ Hard to maintain long-term projects

### With Vibecoding OS:
- ✅ AI follows a **5-phase workflow** (Triage → Planning → Coding → Testing → Review)
- ✅ AI **learns your preferences** and gets better over time (SEAL learning engine)
- ✅ **Quality rules enforced** automatically (Junior Dev Rule, boring code)
- ✅ **Consistent architecture decisions** based on your past choices
- ✅ **Project continuity** across sessions and even different AI platforms

---

## Who Is This For?

**Vibecoders** - People who:
- Can describe what they want in plain English
- Can't code (or don't want to)
- Want to build real software anyway
- Need it to actually work and be maintainable

If you can test whether a button works, you can use Vibecoding OS.

---

## Repository Structure

This is a **monorepo** with two main parts:

### 📦 Core (Platform-Agnostic)

The `core/` directory contains the universal workflow system that works with **any AI** (Claude, GPT-4, etc.):

```
core/
├── 00-core-philosophy.md         # Core principles (Keep It Boring, Junior Dev Rule)
├── 01-workflow-protocol.md       # 5-phase workflow (Triage → Planning → Coding → Testing → Review)
├── 02-seal-engine.md             # Self-Adapting LLM learning system
├── 03-constraints-quality.md     # Quality rules and standards
├── 04-ai-instructions.md         # How AI should behave
├── TERMINOLOGY-GLOSSARY.md       # Official terms and definitions
├── CROSS-REFERENCE-MAP.md        # How files connect
├── SYSTEM-FLOWCHART.md           # Visual system diagrams
├── QUICK-START.md                # Beginner's guide
└── APPENDICES.md                 # Detailed examples and walkthroughs
```

**Use this if:**
- You're using any AI platform (Claude, ChatGPT, Cursor, etc.)
- You want the core workflow without platform-specific enhancements
- You want to create your own integration

### 🔌 Integrations (Platform-Specific)

The `integrations/` directory contains optimizations for specific AI platforms:

```
integrations/
├── claude-code/                  # Claude Code integration
│   ├── commands/                 # Slash commands (/vibecoding, /triage, etc.)
│   ├── agents/                   # Specialized sub-agents per phase
│   ├── scripts/                  # CLI tools for validation and status
│   ├── SETUP-GUIDE.md            # Complete setup instructions
│   └── README.md                 # Integration overview
│
├── cursor/                       # Coming soon
├── windsurf/                     # Coming soon
└── aider/                        # Coming soon
```

**Use integrations if:**
- You want slash commands like `/vibecoding` to load the system instantly
- You want specialized sub-agents (PLANNER, BUILDER, TESTER, SEAL)
- You want CLI tools for code validation and status checks
- You want deeper integration with your AI platform

---

## Installation

### Core Only (Any AI Platform)

```bash
# Clone or download this repository
git clone https://github.com/andrewtmouser-cell/vibecoding-os.git

# Copy core files to your project
cp -r vibecoding-os/core/ your-project/vibecoding-os/

# Copy PROJECT-STATE template
mkdir your-project/.vibecoding
cp vibecoding-os/templates/PROJECT-STATE.md your-project/.vibecoding/

# In your AI chat:
# "Load vibecoding-os/ and initialize PROJECT-STATE.md"
```

### With Claude Code Integration

```bash
# Clone the repository
git clone https://github.com/andrewtmouser-cell/vibecoding-os.git
cd your-project

# Copy core files
cp -r path/to/vibecoding-os/core/ ./vibecoding-os/

# Copy Claude Code integration
cp -r path/to/vibecoding-os/integrations/claude-code/ ./.claude/

# Initialize PROJECT-STATE
mkdir .vibecoding
cp path/to/vibecoding-os/templates/PROJECT-STATE.md .vibecoding/

# Follow setup guide
# See integrations/claude-code/SETUP-GUIDE.md
```

---

## Core Concepts

### 1. The 5-Phase Workflow

Every task goes through structured phases:

- **Phase 0: Triage** - Is this simple (TRIVIAL) or complex (COMPLEX)?
- **Phase 1: Planning** - Ask questions, research, brainstorm, evaluate, specify (7 subphases with STOP & WAIT)
- **Phase 2: Coding** - Build step-by-step (scaffolding → connectivity → core logic → UI binding)
- **Phase 3: Testing** - Manual walkthrough → edge cases → fixes
- **Phase 4: Review** - Code audit → documentation → **SEAL learning**

Simple tasks skip planning. Complex tasks get full treatment.

### 2. SEAL Learning Engine

**Self-Adapting LLM** - AI gets smarter with every task you complete together:

- **Stage 1 (Tasks 1-5)**: Data collection - AI observes what works
- **Stage 2 (Tasks 6-15)**: Pattern emergence - AI starts applying patterns
- **Stage 3 (Tasks 16+)**: Automatic application - AI becomes expert on your project

**How it learns:**
- You rate each task (1-5)
- AI extracts what worked and what didn't
- Patterns stored in `PROJECT-STATE.md` with confidence scores
- Future tasks automatically apply successful patterns

By task 20, AI knows your preferences better than you do.

### 3. Core Principles

**Keep It Boring** - Simple, established tech beats clever complexity

**Junior Dev Rule** - Code must be readable by someone with minimal experience

**Methodical Over Fast** - Quality and thoroughness beat speed

### 4. PROJECT-STATE.md - The Memory File

Single source of truth that survives:
- ✅ Context window resets
- ✅ Switching between AI agents
- ✅ Weeks-long project pauses
- ✅ Team collaboration

Contains:
- Task history with ratings
- Learned patterns (triage, discovery, architecture, coding, testing)
- Project structure and conventions
- Metrics (success rate, pattern confidence)

---

## Documentation

### Getting Started
- **[Quick Start Guide](core/QUICK-START.md)** - 10-minute setup and first task walkthrough
- **[Core Philosophy](core/00-core-philosophy.md)** - Understand the principles
- **[System Flowchart](core/SYSTEM-FLOWCHART.md)** - Visual guide to how everything connects

### Workflow
- **[Workflow Protocol](core/01-workflow-protocol.md)** - Complete 5-phase process
- **[SEAL Engine](core/02-seal-engine.md)** - How AI learns and improves
- **[Quality Constraints](core/03-constraints-quality.md)** - Rules for code quality

### Reference
- **[Terminology Glossary](core/TERMINOLOGY-GLOSSARY.md)** - Official definitions
- **[Cross-Reference Map](core/CROSS-REFERENCE-MAP.md)** - How files integrate
- **[Appendices](core/APPENDICES.md)** - Detailed examples and formulas

### Integrations
- **[Claude Code Integration](integrations/claude-code/README.md)** - Full integration with slash commands, agents, CLI
- More integrations coming soon (Cursor, Windsurf, Aider)

---

## Example: Your First Task

**You:** "I need a contact form with name, email, and message fields."

**AI (Phase 0: Triage):** "Classification: COMPLEX - Initiating planning."

**AI (Phase 1.1):** "Before I proceed:
1. Where should the message be sent?
2. What should happen if sending fails?
3. Should users see confirmation?"

**You:** "Send to API endpoint /api/contact. Show error if fails. Show 'Message sent!' on success."

**AI continues through Phase 1.2-1.7** (research, brainstorm 3 approaches, recommend simple one, identify risks, create specification, wait for GO)

**You:** "GO"

**AI (Phase 2):** Builds the form step-by-step, checking after each subphase

**AI (Phase 3):** Creates test steps: "1. Fill form with valid data → Expected: Success message"

**You test and report results**

**AI (Phase 3.3):** Fixes any bugs found

**AI (Phase 4.3):** "How did I do? Rate 1-5"

**You:** "5/5 - Perfect!"

**AI updates PROJECT-STATE.md** with learned patterns. Next form will be even better.

---

## Success Metrics

### After 5 Tasks:
- AI understands your communication style
- Knows your basic preferences
- Building initial pattern library

### After 15 Tasks:
- Patterns are solid
- Fewer questions needed
- AI anticipates your needs

### After 30 Tasks:
- AI feels like it "knows" your project
- Rarely needs clarification
- High first-try success rate
- Fast execution

---

## Key Features

### ✨ For Non-Programmers
- No coding knowledge required
- Plain English instructions
- Test by clicking/viewing, not code review
- Learn software concepts through building

### 🎯 For AI Consistency
- Structured workflow prevents wandering
- STOP & WAIT checkpoints keep you in control
- Quality rules enforced automatically
- Pattern learning prevents repeated mistakes

### 📈 For Long-Term Projects
- PROJECT-STATE.md survives context resets
- Learned patterns accumulate over time
- Can switch AI platforms mid-project
- Team-friendly (shared PROJECT-STATE)

### 🔧 For Maintainability
- Junior Dev Rule = readable code
- Boring tech = stable dependencies
- Consistent architecture decisions
- Documented reasoning in PROJECT-STATE

---

## Platform Support

### ✅ Fully Supported
- **Claude Code** - Complete integration (slash commands, agents, CLI tools)
- **Any AI with file access** - Core workflow works universally

### 🚧 Coming Soon
- **Cursor** - Integration in development
- **Windsurf** - Integration planned
- **Aider** - Integration planned

### 💡 DIY Integration
Want to create an integration for your platform? See [Contributing](#contributing) section.

---

## FAQ

### "Do I need to understand the code?"

Nope. You test that it works. AI handles implementation.

### "What if AI makes mistakes?"

Phase 3 (Testing) catches bugs. AI fixes them. If fix fails twice, AI tries simpler approach.

### "Can I use this with multiple AIs?"

Yes! Core workflow works with any AI. Just load the files and PROJECT-STATE.md.

### "How long until AI 'learns' my project?"

- Task 1-5: Learning your basics
- Task 6-15: Applying patterns
- Task 16+: Feels like expert on your project

### "What if I take a break for weeks?"

PROJECT-STATE.md stores everything. Just load it when you return. Zero knowledge loss.

### "Can my team use this?"

Yes! Share the repository and PROJECT-STATE.md. Multiple people can collaborate using the same patterns.

---

## Contributing

We welcome contributions!

### Adding Integrations

Want to add support for another AI platform?

1. Create `integrations/[platform-name]/`
2. Add platform-specific tools (commands, scripts, etc.)
3. Write `integrations/[platform-name]/README.md`
4. Submit a pull request

### Improving Core

- Core workflow improvements
- Better examples
- Clearer documentation
- Bug fixes in pattern learning

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines (coming soon).

---

## License

MIT License - See [LICENSE](LICENSE) file for details.

---

## Support

- **Issues**: [GitHub Issues](https://github.com/andrewtmouser-cell/vibecoding-os/issues)
- **Discussions**: [GitHub Discussions](https://github.com/andrewtmouser-cell/vibecoding-os/discussions)
- **Documentation**: All docs in `core/` directory

---

## Credits

Created by context engineers, for context engineers.

**Core Principles:**
- Keep It Boring (inspired by "Choose Boring Technology")
- Junior Dev Rule (code readability first)
- SEAL Learning (self-improving AI workflows)

---

**Ready to start vibecoding?** → [Quick Start Guide](core/QUICK-START.md)

**Using Claude Code?** → [Claude Code Integration](integrations/claude-code/)

**Want to dive deep?** → [Core Philosophy](core/00-core-philosophy.md)
