# Vibecoding OS

**A self-improving AI coding system for non-technical builders.**

Vibecoding OS is a structured methodology for working with AI coding assistants (Claude, ChatGPT, Cursor, etc.) that ensures quality, consistency, and continuous improvement—even if you don't know how to code.

## What This Is

This is a **system**, not code. It defines:
- 📋 **How AI should work with you** (strict workflow)
- 🛡️ **Quality guardrails** (prevents bad code)
- 🧠 **Learning mechanism** (gets better over time)
- 📚 **Pattern templates** (reusable solutions)

## Who This Is For

- **Vibecoders** - Non-technical founders building with AI
- **AI-first builders** - People who can't debug their own code
- **Methodical builders** - Those who prioritize quality over speed

## Why You Need This

**Without a system:**
- ❌ AI makes inconsistent choices
- ❌ Code quality varies wildly
- ❌ Hard to resume after context window resets
- ❌ No learning between projects
- ❌ Easy to get stuck with broken code

**With Vibecoding OS:**
- ✅ AI follows strict methodology
- ✅ Code is always "junior dev readable"
- ✅ Seamless continuity across sessions
- ✅ Patterns improve over time
- ✅ Can't deploy broken code (guardrails)

## Quick Start

### 1. Add to Your Project

```bash
# Option A: Clone directly
git clone https://github.com/yourusername/vibecoding-os.git

# Option B: Add as submodule (recommended)
git submodule add https://github.com/yourusername/vibecoding-os.git
```

### 2. Copy Project State Template

```bash
mkdir .vibecoding
cp vibecoding-os/templates/PROJECT-STATE.md .vibecoding/
```

### 3. Start Your First Task

In your AI chat (Claude, ChatGPT, etc.):

```
Load all files from the vibecoding-os/ folder.
Read .vibecoding/PROJECT-STATE.md for project state.
I want to build [describe your project].
Start with Phase 0 (Triage).
```

## How It Works

### The 5-Phase Workflow

**Phase 0: Triage**
- AI classifies task as trivial or complex
- Decides which phases to execute

**Phase 1: Planning** (6 subphases)
- Discovery (interview you)
- Research (check existing code)
- Brainstorm (propose 3 approaches)
- Evaluation (score options)
- Premortem (identify risks)
- Specification (detailed plan)

**Phase 2: Coding** (4 steps)
- Scaffolding (structure)
- Connectivity (hello world with dummy data)
- Core Logic (implement features)
- UI Binding (connect everything)

**Phase 3: Testing**
- Manual walkthrough
- Edge case assault
- Fix & repeat

**Phase 4: Review & Learning**
- Code audit
- Documentation
- SEAL learning update

### SEAL Learning Engine

After each task:
1. **Extract** what worked
2. **Update** pattern library
3. **Apply** learned patterns to future tasks

Example: After creating 3 React components, SEAL learns:
- Your preferred file structure
- Naming conventions
- Styling approach
- Testing patterns

Then automatically applies this to component #4.

## File Structure

```
vibecoding-os/
├── README.md                    # This file
├── 00-core-philosophy.md        # Why this system works
├── 01-workflow-protocol.md      # Phase 0-4 detailed steps
├── 02-seal-engine.md            # Learning mechanism
├── 03-constraints-quality.md    # Quality guardrails
├── 04-ai-instructions.md        # How AI should behave
│
├── templates/
│   ├── PROJECT-STATE.md         # Copy to each project
│   ├── pattern-template.md      # For creating patterns
│   └── task-log-entry.md        # For tracking tasks
│
└── starter-kits/
    ├── nextjs-app/              # Next.js App Router starter
    ├── react-spa/               # React SPA starter
    └── express-api/             # Express API starter
```

## Core Principles

### 1. Keep It Boring
- Default to monoliths (not microservices)
- Use standard libraries (not bleeding edge)
- Avoid complexity (not "clever code")

### 2. Junior Dev Rule
- All code must be readable by a junior developer
- Explicit > DRY
- Comments explain "why", not "what"

### 3. Methodical Over Fast
- Never skip phases
- Always plan before coding
- Test before declaring "done"

### 4. Self-Improving
- Learn from every task
- Build pattern library
- Apply patterns automatically

## Usage Examples

### Example 1: Starting a New Project

```
You: "I want to build a todo app with Next.js"

AI: [Loads vibecoding-os]
Phase 0: TRIAGE
Classification: COMPLEX (new project)
→ Initiating Phase 1 (Planning)

Phase 1.1: DISCOVERY
Questions:
- Do you need user authentication?
- Should todos sync to a database or stay local?
- Any specific design style?

[AI proceeds through all phases methodically]
```

### Example 2: Resuming After Context Reset

```
You: "Load vibecoding-os/ and .vibecoding/PROJECT-STATE.md.
      Continue from where we left off."

AI: Project state loaded.
Project: Todo App
Completed Tasks: 7
Current Task: #8 (User Authentication)
Current Phase: 2 (Coding - Core Logic)
Next Step: Implement JWT token generation

Ready to continue! Proceeding with JWT implementation...
```

### Example 3: Using Learned Patterns

```
You: "Add a Settings page"

AI: [Loads pattern from PROJECT-STATE.md]
Pattern Found: "Page Component Structure" (Confidence: 0.92)
Applying learned pattern:
- Creating src/app/settings/page.tsx
- Using layout pattern from Dashboard
- Including loading.tsx and error.tsx
- Matching established styling approach

[Creates consistent page matching existing patterns]
```

## Key Features

### 🛡️ Quality Guardrails

The system enforces:
- No clever code
- Explicit variable names
- Error handling on all user actions
- Loading states for all async operations
- Plain English error messages

### 📊 Progress Tracking

Every task tracked in PROJECT-STATE.md:
- What was done
- What was learned
- What patterns emerged
- What's next

### 🔄 Context Window Safety

When approaching context limits:
1. AI updates PROJECT-STATE.md completely
2. You start new chat
3. AI reloads state instantly
4. Work continues seamlessly

### 🧠 Growing Intelligence

With each project:
- Pattern library grows
- Confidence scores increase
- Decision-making improves
- Fewer iterations needed

## Complementary: Personal Knowledge Base

For advanced users, pair this with `vibecoding-knowledge` (private repo):
- Proven patterns across projects
- Code snippets that always work
- Best practices you've learned

See: [vibecoding-knowledge setup guide](#) (if you have one)

## Requirements

- AI assistant with file reading capability (Claude Code, ChatGPT with Code Interpreter, Cursor, etc.)
- Basic familiarity with git
- A project you want to build

No coding knowledge required.

## Updates

To get the latest version:

```bash
cd vibecoding-os
git pull origin main
```

Your project-specific state (`.vibecoding/PROJECT-STATE.md`) is separate and won't be affected.

## Philosophy

**This system exists because:**

1. **AI is inconsistent** - Needs structure to be reliable
2. **Non-coders can't debug** - Need quality code first time
3. **Context windows reset** - Need persistent state
4. **Learning should compound** - Patterns should improve over time

**The result:** AI that gets better at building YOUR projects, in YOUR style, with YOUR preferences.

## Contributing

Improvements welcome! If you find patterns that work, submit a PR.

## License

MIT License - Use freely, commercially or personally.

## Credits

Built for vibecoders, by vibecoders.

Inspired by:
- SEAL (Self-Adapting LLMs) - MIT CSAIL
- The "Keep It Boring" philosophy
- Junior developer mentorship practices

---

**Ready to build? Copy this repo and start your first task!**

```bash
git clone https://github.com/yourusername/vibecoding-os.git
cp vibecoding-os/templates/PROJECT-STATE.md .vibecoding/
# Then tell your AI to load vibecoding-os/ and begin!
```
