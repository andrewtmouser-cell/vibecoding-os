# Vibecoding OS - Quick Start Guide

**Get up and running in 10 minutes**

---

## What Is Vibecoding OS?

Think of it as an "operating system" for AI coding. Just like Windows or macOS makes your computer work predictably, Vibecoding OS makes AI code for you predictably.

**Without it**: AI is inconsistent, makes different choices each time, and forgets what worked before.

**With it**: AI follows a structured process, learns your preferences, and gets better at your projects over time.

---

## Who Is This For?

You're a **Vibecoder** - someone who:
- Can describe what you want in plain English
- Can't code (or don't want to)
- Want to build real software anyway
- Need it to actually work and be maintainable

If that's you, keep reading.

---

## 5-Minute Setup

### Step 1: Copy the Template

```bash
# In your project folder:
mkdir .vibecoding
cp vibecoding-os/templates/PROJECT-STATE.md .vibecoding/
```

That's it. You're ready to go.

### Step 2: Tell AI to Load the System

In your AI chat, say:

```
Load vibecoding-os/ and start using it for this project.
Copy .vibecoding/PROJECT-STATE.md from the template and initialize it.
```

AI will:
- Read all the system files
- Initialize your PROJECT-STATE.md
- Tell you it's ready

### Step 3: Give Your First Task

Start simple:

```
I need a button that says "Click Me" on my homepage.
```

AI will automatically:
- Classify it (probably TRIVIAL)
- Skip planning
- Code it following quality rules
- Test it
- Update the learning file

That's it. You just used Vibecoding OS.

---

## How It Works (The Simple Version)

### The 5 Phases

Every task goes through up to 5 phases:

**Phase 0: Triage**
- Is this simple or complex?
- Simple = skip to coding
- Complex = do full planning

**Phase 1: Planning** (only for complex tasks)
- Figure out what you really want
- Research existing code
- Propose 3 approaches (simple to complex)
- Pick the best one
- Plan how to build it
- Get your approval

**Phase 2: Coding**
- Build it step-by-step
- Check after each step
- Follow quality rules

**Phase 3: Testing**
- Give you test steps
- Try to break it
- Fix what breaks

**Phase 4: Review**
- Clean the code
- Update docs
- **SEAL Learning** - remember what worked

### STOP & WAIT

During Planning (Phase 1), AI will STOP & WAIT after each step for your confirmation.

This ensures you're involved in decisions, not surprised by them.

Just say:
- "Continue" or "Proceed" to move forward
- Give feedback if something's not right
- Ask questions if unclear

### SEAL Learning

After every task, AI asks: "How did I do? (Rate 1-5)"

- Rate 4-5: AI learns what worked, does it again
- Rate 1-3: AI learns what didn't work, avoids it

By Task 20, AI knows:
- How you like code structured
- Which questions get useful answers
- What "done" means to you
- Your specific project quirks

It becomes "your" AI.

---

## What the Files Mean

You don't need to read them all, but here's what they do:

### [00-core-philosophy.md](00-core-philosophy.md)
**The "Why"** - Explains the principles

**Read this**: If you want to understand the thinking behind the system

**Key principles**:
- Keep It Boring (simple tech beats complex)
- Junior Dev Rule (code must be super readable)
- Methodical Over Fast (quality beats speed)

### [01-workflow-protocol.md](01-workflow-protocol.md)
**The "How"** - Step-by-step workflow

**Read this**: If you want to understand what happens in each phase

**You'll reference this**: When AI says "Phase 1.2: Research" and you wonder what that means

### [02-seal-engine.md](02-seal-engine.md)
**The "Learning"** - How AI gets smarter

**Read this**: If you're curious how patterns work

**You'll see this**: When AI says "Applying learned pattern (confidence: 0.88)"

### [03-constraints-quality.md](03-constraints-quality.md)
**The "Rules"** - Quality standards

**Read this**: If you want to know what "quality" means in this system

**AI follows this**: Every time it writes code

### [04-ai-instructions.md](04-ai-instructions.md)
**The "Contract"** - How AI should behave

**Read this**: If you're training a new AI on your project

**AI reads this**: At the start of every session

### [PROJECT-STATE.md](templates/PROJECT-STATE.md)
**The "Memory"** - Everything AI learns about your project

**Edit this**: Never (AI updates it automatically)

**Review this**: Weekly, to see what AI has learned

---

## Your First Real Task (Step-by-Step)

Let's do a real feature together. Say you want a contact form.

### 1. Give the Request

```
I need a contact form where users can enter their name, email, and message,
then click "Send". It should show a loading spinner while sending and
display "Message sent!" when done.
```

### 2. AI Starts Phase 0: Triage

AI will say:

```
Phase 0: TRIAGE - Classification: COMPLEX
This requires planning. Initiating Phase 1 (Planning).
```

### 3. Phase 1.1: Discovery

AI asks clarifying questions:

```
Phase 1.1: DISCOVERY

Before I proceed, I need to clarify:

1. Where should the message go? (Email? Database? API?)
2. Should it work if the user is offline?
3. What should happen if sending fails?

⏸️ Waiting for your confirmation to proceed.
```

**You answer:**
```
1. Send to my email: me@example.com
2. No, needs internet
3. Show "Failed to send. Please try again."
```

### 4. AI Continues Through Planning

AI will STOP & WAIT after:
- Research (checked your existing code)
- Brainstorm (proposed 3 approaches)
- Evaluation (recommended the simple one)
- Premortem (identified risks like "network offline")
- Specification (detailed plan)

### 5. Phase 1.7: Approval

```
Phase 1.7: APPROVAL

I've planned:
- Create ContactForm component with 3 fields
- Add email sending via API route
- Include loading state, error handling, success message
- 4 files to create/modify

Type 'GO' to start Phase 2 (Coding).
```

**You say:** `GO`

### 6. Phase 2: Coding

AI builds it step-by-step, checking after each:
- 2.1: Scaffolding (file structure)
- 2.2: Connectivity (dummy data test)
- 2.3: Core Logic (validation, sending)
- 2.4: UI Binding (real form with styling)

### 7. Phase 3: Testing

```
Phase 3.1: MANUAL WALKTHROUGH

Test Steps:
1. Navigate to /contact
2. Fill out form with valid data
3. Click "Send"
   - Expected: Loading spinner appears
   - Expected: "Message sent!" after 1-2 seconds
4. Try sending with invalid email
   - Expected: Error message appears

Test these and report back.
```

**You test it, report results**

### 8. Phase 4: Review

```
Phase 4.1: CODE AUDIT - Complete ✓
Phase 4.2: DOCUMENTATION - Complete ✓
Phase 4.3: SEAL LEARNING

Rating (1-5): ___

What worked well:
What could be better:
```

**You rate it:** `5/5 - Perfect, exactly what I wanted`

### 9. AI Updates PROJECT-STATE.md

```
Task #1: Contact Form - COMPLETE ✅
Rating: 5/5
Files: ContactForm/index.tsx, ContactForm/styles.module.css, api/contact.ts

Pattern Created: Form Handling (Confidence: 0.33)
- Include loading states
- Show clear error messages
- Use plain English validation

Next form will be even better!
```

---

## Common Questions

### "Do I need to understand the code?"

Nope. That's the whole point. You just need to test that it works.

### "What if I want to change something after it's done?"

Just ask. "Change the button color to blue" is a new task. AI will do it.

### "What if it breaks?"

AI has emergency protocols. It will:
1. Try a surgical fix
2. If that fails, try a simpler approach
3. If that fails, ask you to rollback

### "How long does this take?"

- Simple tasks (change color): 2-5 minutes
- Medium tasks (new button): 10-15 minutes
- Complex tasks (new feature): 30-60 minutes

Gets faster as AI learns your project.

### "Can I use this with any AI?"

Yes, but works best with:
- Claude (Anthropic)
- GPT-4 or newer (OpenAI)
- Any AI that can follow structured instructions

### "Do I need to be online?"

Yes, AI needs internet. Your project can work offline, but building it requires AI.

---

## What Success Looks Like

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
- First-try success rate high
- Fast execution

---

## Tips for Success

### 1. Rate Honestly

Don't give 5/5 just to be nice. Rate based on:
- Did it work correctly?
- Was it what you wanted?
- Did you need multiple iterations?

Honest ratings = better learning.

### 2. Be Specific in Requests

❌ "Add a form"
✅ "Add a contact form with name, email, message fields and a send button"

More detail = better result.

### 3. Don't Skip Stop & Wait

When AI says "STOP & WAIT", actually review the output before saying "Continue".

Catching issues in planning saves time in coding.

### 4. Review PROJECT-STATE.md Weekly

Check what AI has learned. If something's wrong, edit it.

AI will read the corrections next time.

### 5. Start Simple

First few tasks should be easy:
- Add a button
- Change some text
- Update a color

Let AI learn your project before tackling complex features.

---

## Troubleshooting

### "AI isn't following the workflow"

Remind it:

```
Please follow vibecoding-os workflow. We're in Phase 1.
Load the files and follow the process.
```

### "AI keeps making clever, complex code"

Point to the rules:

```
This violates the Junior Dev Rule. Please simplify.
See 03-constraints-quality.md Section 1.
```

### "Patterns aren't improving"

Check your ratings. If everything is 4-5, AI thinks it's doing great.

Rate honestly - 3/5 means "not quite right."

### "Context window filled up"

Tell AI:

```
We're approaching context limit. Please update PROJECT-STATE.md
completely, then I'll start a new chat.
```

AI will update everything, then you start fresh with:

```
Load vibecoding-os/ and .vibecoding/PROJECT-STATE.md.
Continue from Task #[X].
```

---

## Next Steps

### New to This?

1. ✅ Do the "First Real Task" walkthrough above
2. Read [00-core-philosophy.md](00-core-philosophy.md) to understand the "why"
3. Skim [01-workflow-protocol.md](01-workflow-protocol.md) to see all the phases
4. Start building!

### Ready to Deep Dive?

1. Read [SYSTEM-FLOWCHART.md](SYSTEM-FLOWCHART.md) to see how everything connects
2. Read [02-seal-engine.md](02-seal-engine.md) to understand the learning system
3. Check [TERMINOLOGY-GLOSSARY.md](TERMINOLOGY-GLOSSARY.md) for exact definitions

### Want Visual Understanding?

Open [SYSTEM-FLOWCHART.md](SYSTEM-FLOWCHART.md) - it has diagrams showing:
- How files relate
- Where SEAL integrates
- What happens in each phase
- How information flows

---

## Remember

**You're not writing code. You're directing AI to write code.**

- Your job: Describe what you want, test that it works, rate the result
- AI's job: Plan it, build it, test it, learn from it

**The system makes AI consistent, methodical, and self-improving.**

Over time, it becomes your personal expert on your specific project.

---

**Welcome to Vibecoding. Let's build something.**

---

## Quick Reference Card

Copy this for easy reference:

```
┌─────────────────────────────────────────────────────┐
│           VIBECODING OS QUICK REFERENCE             │
├─────────────────────────────────────────────────────┤
│ START SESSION:                                      │
│ "Load vibecoding-os/ and .vibecoding/PROJECT-      │
│  STATE.md. Ready for next task."                    │
├─────────────────────────────────────────────────────┤
│ GIVE TASK:                                          │
│ Be specific. Describe what you want in plain       │
│ English with as much detail as possible.           │
├─────────────────────────────────────────────────────┤
│ DURING PLANNING:                                    │
│ AI will STOP & WAIT. Review, then say:             │
│ - "Continue" to proceed                            │
│ - Give feedback to adjust                          │
│ - "GO" at Phase 1.7 to start coding               │
├─────────────────────────────────────────────────────┤
│ DURING CODING:                                      │
│ AI will CHECK after each step.                     │
│ Confirm it compiled/ran before continuing.         │
├─────────────────────────────────────────────────────┤
│ DURING TESTING:                                     │
│ Follow test steps AI provides.                     │
│ Report what works and what breaks.                 │
├─────────────────────────────────────────────────────┤
│ RATE THE TASK:                                      │
│ 5 = Perfect                                        │
│ 4 = Good, minor tweaks                            │
│ 3 = Okay, needed iteration                        │
│ 2 = Not quite right                               │
│ 1 = Way off                                        │
├─────────────────────────────────────────────────────┤
│ EMERGENCY:                                          │
│ If code breaks: "Rollback to last working state   │
│ and try a simpler approach"                        │
└─────────────────────────────────────────────────────┘
```

Keep this handy!
