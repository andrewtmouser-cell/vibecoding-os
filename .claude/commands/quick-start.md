---
description: First-time setup guide for VibeCoding OS
---

# VibeCoding OS Quick Start

Welcome! This guide will help you set up VibeCoding OS for your project.

## Step 1: Verify Setup

Check if .vibecoding/PROJECT-STATE.md exists:

**If it exists**: Great! Skip to Step 3.

**If it doesn't exist**:
```bash
mkdir .vibecoding
cp vibecoding-os/templates/PROJECT-STATE.md .vibecoding/
```

## Step 2: Initialize PROJECT-STATE.md

Read .vibecoding/PROJECT-STATE.md and help user fill in Section 1:

Ask the user:
1. What's the project name?
2. What are you building? (1-2 sentence description)
3. Tech stack? (Next.js, React, Vue, etc.)
   - If they don't know, I'll help figure it out by checking package.json
4. Database? (Postgres, Supabase, Firebase, none yet, etc.)
5. Styling approach? (Tailwind, CSS Modules, styled-components, etc.)
6. Deployment platform? (Vercel, Netlify, not decided yet, etc.)

Update Section 1 (Project Information) with their answers.

## Step 3: Explain the System

Provide overview:

```
VibeCoding OS is a systematic approach to building with AI.

How it works:
1. You describe what you want (plain English)
2. I follow a 5-phase process to build it
3. System learns your preferences over time
4. Each task makes future tasks faster

The 5 Phases:
- Phase 0: Triage (classify request)
- Phase 1: Planning (interview you, create PRP)
- Phase 2: Coding (build step-by-step with checks)
- Phase 3: Testing (automated + manual validation)
- Phase 4: Review (update learnings)

Key Features:
✅ Quality guardrails (code you can trust)
✅ SEAL learning (gets better over time)
✅ PRP process (one-pass implementation)
✅ Automated testing (catches bugs early)
✅ PROJECT-STATE.md (survives context resets)

You'll never need to:
- Write code yourself
- Debug technical issues
- Understand complex frameworks
- Read error messages

I handle all technical details in plain English.
```

## Step 4: First Task

Ask: "What would you like to build first?"

Then start with Phase 0 using the full system:
- Load all vibecoding-os files
- Follow 01-workflow-protocol.md
- Use 05-prp-builder-guide.md for planning
- Use 06-automated-validation.md for testing
- Apply 03-constraints-quality.md throughout

## Available Slash Commands

You can use these anytime:

- `/start-task` - Start a new task
- `/continue` - Continue current task
- `/review-patterns` - See what I've learned about your preferences
- `/run-tests` - Run validation and tests
- `/quick-start` - This guide

## Tips for Success

1. **Be specific but not technical**
   Good: "I want users to add items to a shopping cart"
   Not needed: "Create a Redux store with cart reducer..."

2. **Answer my questions during Planning**
   I'll interview you to understand requirements

3. **Test thoroughly in Phase 3**
   Your testing helps me learn your preferences

4. **Rate tasks honestly in Phase 4**
   Ratings help SEAL learning improve

5. **Trust the process**
   Methodical = better results than rushing

Ready to start your first task?
