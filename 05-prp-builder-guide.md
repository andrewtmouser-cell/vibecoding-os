# PRP Builder Guide for Non-Coders

**Product Requirement Prompt (PRP) Creation Through Conversation**

---

## What is a PRP?

A **Product Requirement Prompt (PRP)** is a detailed technical specification that tells AI exactly what to build and how to build it.

**The problem**: Traditional PRPs require technical knowledge (file paths, library names, API endpoints).

**Your solution**: AI interviews you in plain English, then translates your answers into a technical PRP.

**Result**: You get one-pass implementation success without knowing how to code.

---

## How It Works

### Phase 1.1-1.3 (Discovery → Brainstorm)
You answer plain-English questions about what you want.

### Phase 1.4-1.5 (Evaluation → Premortem)
AI converts your answers into technical approach options.

### Phase 1.6 (Specification → PRP Generation)
AI creates a complete PRP document with all technical details.

### Phase 1.7 (Approval)
You review the PRP in plain English summary, approve, and AI executes it.

---

## The Interview Process

### Stage 1: Understanding the Feature (Phase 1.1)

**AI asks you questions like**:

```
Feature Discovery Questions:

1. WHAT: What do you want users to be able to do?
   - Describe it like you're explaining to a friend
   - What's the main action?
   - What's the end result?

2. WHO: Who will use this feature?
   - Just you? Team members? Public users?
   - Do they need to be logged in?
   - Any permission differences?

3. WHERE: Where in the app does this happen?
   - New page? Existing page?
   - Modal/popup? Sidebar? Main content?
   - How do users get there?

4. WHEN: When should things happen?
   - Immediately? After delay? On schedule?
   - Real-time updates?
   - Any triggers or conditions?

5. INPUTS: What information do users provide?
   - Text fields? Dropdowns? File uploads?
   - Required vs optional?
   - Any validation rules you want?

6. OUTPUTS: What should users see/get?
   - Success message? New page? Download?
   - Error handling - what happens if it fails?
   - Loading states - what do users see while waiting?

7. DATA: What information needs to be saved?
   - What gets stored in database?
   - What gets lost when page refreshes?
   - Any relationships to existing data?

8. EDGE CASES: What could go wrong?
   - Empty states (no data yet)
   - Too much data
   - Slow internet
   - User mistakes
```

**Example Conversation**:

```
AI: What do you want users to be able to do?

You: I want them to add items to a todo list.

AI: Got it. Should these todos be saved permanently or just during the session?

You: Permanently. I want them there when I come back tomorrow.

AI: Perfect. What information should each todo have?

You: Just a title and whether it's completed or not.

AI: Should users be able to edit todos after creating them?

You: Yes, and delete them too.

AI: Great. Where should this todo list appear?

You: On the main page when they log in.

AI: Understood. Should todos be private (each user sees only theirs) or shared?

You: Private. Each user has their own list.
```

---

### Stage 2: Technical Constraints Discovery (Phase 1.2)

**AI asks about your existing setup**:

```
Technical Context Questions:

1. TECH STACK:
   - What framework are you using? (Next.js, React, etc.)
   - What version? (AI can check package.json)
   - Database? (Postgres, Supabase, Firebase, etc.)

2. EXISTING CODE:
   - Do you have similar features already built?
   - Any components/patterns I should reuse?
   - Any libraries already installed I should use?

3. STYLING:
   - What styling system? (Tailwind, CSS modules, etc.)
   - Any design system/component library? (shadcn, MUI, etc.)
   - Should this match existing pages?

4. AUTHENTICATION:
   - How do users log in? (Clerk, Auth0, NextAuth, custom?)
   - How do we get current user ID?

5. STATE MANAGEMENT:
   - How do you manage state? (React hooks, Zustand, Redux, etc.)
   - Any patterns I should follow?

6. API STRUCTURE:
   - REST or GraphQL?
   - Where do API routes live?
   - Any naming conventions?
```

**AI Research Phase**:
- Reads your codebase to find patterns
- Checks package.json for installed libraries
- Identifies existing conventions
- Finds similar features to reuse patterns

---

### Stage 3: Approach Options (Phase 1.3-1.4)

**AI presents 2-3 approaches in plain English**:

```
Approach 1: Simple & Proven
What: Use the same pattern as your existing notes feature
Pros: Fast, consistent with codebase, proven to work
Cons: Missing some modern features like optimistic updates
Estimated Complexity: Low

Approach 2: Modern & Robust
What: Use React Query for data fetching with optimistic updates
Pros: Better user experience, handles offline, automatic retries
Cons: Requires new library, more complex
Estimated Complexity: Medium

Approach 3: Minimal MVP
What: Start with local state only, no database yet
Pros: Very fast to build, easy to test concept
Cons: Data lost on refresh, need to rebuild later
Estimated Complexity: Very Low
```

**You choose**: "I like Approach 1 - let's keep it simple and consistent."

---

### Stage 4: PRP Generation (Phase 1.6)

**AI creates the technical PRP** (you don't write this part):

```markdown
# PRP: Todo List Feature

## Goal
Enable authenticated users to create, view, update, and delete personal todo items with persistent storage.

## Why
User requested task management functionality for tracking personal todos. Data must persist across sessions.

## Success Criteria
- [ ] User can add todo with title
- [ ] User can mark todo as complete/incomplete
- [ ] User can edit todo title
- [ ] User can delete todo
- [ ] Todos persist across sessions
- [ ] Only user's own todos are visible
- [ ] Loading states during operations
- [ ] Error messages in plain English

## Context

### Tech Stack
- Framework: Next.js 14.2.3 (App Router)
- Database: Supabase (PostgreSQL)
- Auth: Clerk
- Styling: Tailwind + shadcn/ui
- State: React hooks + SWR for data fetching

### Existing Patterns (from codebase analysis)
- Similar feature: Notes feature (/app/notes/page.tsx)
- API pattern: Route handlers in /app/api/[resource]/route.ts
- Database client: lib/supabase.ts (singleton pattern)
- Component pattern: shadcn Card + Form components
- Error handling: toast notifications (lib/toast.ts)

### File Locations
- Page: /app/todos/page.tsx (create new)
- API: /app/api/todos/route.ts (create new)
- Types: /types/todo.ts (create new)
- Components: Reuse from /components/ui/
- Database: Extend schema in supabase/migrations/

## Implementation Blueprint

### 1. Database Schema
```sql
CREATE TABLE todos (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id TEXT NOT NULL,
  title TEXT NOT NULL,
  completed BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_todos_user_id ON todos(user_id);
```

### 2. TypeScript Types
```typescript
// types/todo.ts
export interface Todo {
  id: string;
  user_id: string;
  title: string;
  completed: boolean;
  created_at: string;
  updated_at: string;
}

export interface CreateTodoDTO {
  title: string;
}

export interface UpdateTodoDTO {
  title?: string;
  completed?: boolean;
}
```

### 3. API Endpoints

**GET /api/todos**
- Returns all todos for current user
- Sorted by created_at DESC
- 401 if not authenticated

**POST /api/todos**
- Body: { title: string }
- Creates todo for current user
- Returns created todo
- 400 if title empty

**PATCH /api/todos/[id]**
- Body: { title?: string, completed?: boolean }
- Updates specified fields
- 404 if not found or not user's todo

**DELETE /api/todos/[id]**
- Deletes todo
- 404 if not found or not user's todo

### 4. UI Components

**TodoList Component**
- Fetches todos using SWR
- Shows loading skeleton while fetching
- Empty state: "No todos yet. Add one above!"
- Maps todos to TodoItem components

**TodoItem Component**
- Checkbox for completion (optimistic update)
- Editable title (inline edit)
- Delete button with confirmation
- Strike-through style when completed

**AddTodo Component**
- Input field with "Add" button
- Enter key submits
- Clears input after submit
- Shows error toast if fails

### 5. Error Handling
- Network errors: "Connection issue. Check your internet."
- Validation errors: "Todo title cannot be empty."
- Auth errors: "Please log in to manage todos."
- General errors: "Something went wrong. Please try again."

### 6. Loading States
- Initial load: Skeleton UI (3 placeholder todos)
- Create: Button shows spinner, input disabled
- Update: Checkbox shows spinner
- Delete: Item fades with spinner

## Validation Loop

### Automated Checks
```bash
# Build check
npm run build

# Type check
npm run type-check

# Linting
npm run lint

# Tests
npm run test:todos
```

### Manual Validation (your testing)
- [ ] Add todo with title "Test todo" - appears in list
- [ ] Click checkbox - todo shows as completed with strike-through
- [ ] Click again - todo shows as incomplete
- [ ] Edit title - changes are saved
- [ ] Delete todo - removed from list
- [ ] Refresh page - todos still there
- [ ] Log out and back in - todos still there
- [ ] Check another user doesn't see my todos

### Edge Cases to Verify
- [ ] Add empty title - shows error, doesn't create
- [ ] Add very long title (500+ chars) - handles gracefully
- [ ] Delete while offline - shows error, doesn't break
- [ ] Rapid clicking - doesn't create duplicates

## Codebase Intelligence

### Files to Create
- /app/todos/page.tsx
- /app/api/todos/route.ts
- /app/api/todos/[id]/route.ts
- /types/todo.ts
- /components/todos/TodoList.tsx
- /components/todos/TodoItem.tsx
- /components/todos/AddTodo.tsx
- /supabase/migrations/YYYYMMDD_create_todos.sql

### Files to Modify
- None (isolated feature)

### Dependencies to Install
- None (all required libraries already installed)

### Gotchas
- Clerk userId format: "user_xxxxx" (include in database)
- Supabase RLS: Need to add policies for user_id filtering
- SWR cache key: Use "/api/todos" for proper revalidation
- Optimistic updates: Revert on error (SWR handles this)

## Reference Documentation
- Clerk Auth: https://clerk.com/docs/references/nextjs/auth
- SWR Data Fetching: https://swr.vercel.app/docs/getting-started
- shadcn Forms: https://ui.shadcn.com/docs/components/form
- Supabase RLS: https://supabase.com/docs/guides/auth/row-level-security
```

---

### Stage 5: Plain English Summary & Approval (Phase 1.7)

**AI presents to you**:

```
Here's what I'm going to build:

FEATURE: Personal todo list

WHAT YOU'LL SEE:
- New page at yourapp.com/todos
- Input box to add todos at top
- List of your todos below
- Each todo has checkbox (mark complete) and delete button
- Can click todo title to edit it
- Completed todos have strike-through text

HOW IT WORKS:
- Todos saved in database (persist forever)
- Only you can see your todos
- Works like your existing Notes feature (same style)
- Shows "Loading..." while fetching
- Shows friendly error messages if something breaks

TESTING CHECKLIST:
After I build it, you'll test:
1. Add a todo → see it in list
2. Check the box → todo gets strike-through
3. Edit the title → changes save
4. Delete it → todo disappears
5. Refresh page → todo still there
6. Log out and in → todo still there

WHAT I'LL CREATE:
- 1 new page (todos page)
- 3 API endpoints (get, create, update, delete)
- Database table
- 3 UI components
- Automated tests

ESTIMATED TIME: 30-45 minutes

Ready to proceed? (Type "yes" or ask any questions)
```

**You**: "Yes, let's do it!"

---

## Question Templates by Feature Type

### CRUD Feature (Create, Read, Update, Delete)

```
1. What thing are you managing? (todos, notes, contacts, etc.)
2. What fields/information does each one have?
3. Can users create new ones?
4. Can users edit them?
5. Can users delete them?
6. Should there be a list view?
7. Should there be a detail view?
8. Any filtering or sorting?
9. Any search?
10. Should data be private to each user or shared?
```

### Form Feature

```
1. What information are you collecting?
2. Which fields are required vs optional?
3. Any validation rules? (email format, min/max length, etc.)
4. What happens after successful submission?
5. Should form data be saved if user leaves page?
6. Any conditional fields? (show field B only if field A is X)
7. File uploads?
8. Multi-step or single page?
```

### Dashboard/View Feature

```
1. What data should be displayed?
2. Any charts or visualizations?
3. Any filters or date ranges?
4. Real-time updates or static?
5. Any export functionality?
6. Mobile responsive requirements?
7. Any interactive elements?
```

### Integration Feature

```
1. What service are you integrating with?
2. Do you have API keys already?
3. What data do you need from them?
4. What data do you send to them?
5. When should integration trigger? (user action, schedule, webhook)
6. What happens if integration fails?
7. Any rate limits to consider?
```

### Authentication Feature

```
1. How should users sign up? (email, social, magic link)
2. What user information do you need?
3. Password requirements?
4. Email verification required?
5. Remember me functionality?
6. Password reset flow?
7. Any role-based permissions?
```

---

## AI's Research Checklist

Before generating PRP, AI must research:

**Codebase Analysis**:
- [ ] Read package.json for tech stack and versions
- [ ] Find similar features to reuse patterns
- [ ] Identify styling approach
- [ ] Locate API pattern conventions
- [ ] Check authentication implementation
- [ ] Find state management approach
- [ ] Identify database client usage

**Pattern Identification**:
- [ ] File naming conventions
- [ ] Folder structure patterns
- [ ] Component patterns (props, composition)
- [ ] Error handling patterns
- [ ] Loading state patterns
- [ ] Form validation patterns
- [ ] API response formats

**Dependencies Check**:
- [ ] What's already installed?
- [ ] What needs to be added?
- [ ] Version compatibility
- [ ] Peer dependencies

**Learned Patterns (from PROJECT-STATE.md)**:
- [ ] Load Section 5 (SEAL Learned Patterns)
- [ ] Apply relevant patterns with confidence ≥ 0.7
- [ ] Note any conflicts with existing patterns

---

## Example: Complete Flow

### User Request
"I want to add a contact form to my website."

### AI Interview (5 minutes)

```
AI: What information do you want to collect?
You: Name, email, and message.

AI: Should any fields be optional?
You: Name and email required, message required.

AI: What happens after they submit?
You: They should see a thank you message, and I should get an email.

AI: Where should this form appear?
You: On a /contact page.

AI: Any spam protection?
You: Yes, would be nice.

AI: I can add a simple honeypot (invisible to real users, catches bots). Sound good?
You: Perfect!
```

### AI Research (2 minutes)
- Checks package.json: Next.js 14, React Email installed
- Finds form pattern: shadcn forms used elsewhere
- Identifies email service: Resend API (found in .env.example)
- Confirms styling: Tailwind with shadcn/ui

### AI Generates PRP (1 minute)
Creates complete technical PRP with:
- Contact form schema
- API endpoint specification
- Email template
- Validation rules
- Error handling
- Success/loading states
- Honeypot implementation

### AI Presents Summary (1 minute)

```
WHAT YOU'LL GET:
- Contact page at yoursite.com/contact
- Form with name, email, message fields
- Spam protection (invisible to users)
- Thank you message after submit
- Email sent to you with their message
- Friendly error messages
- Loading spinner during submit

TESTING CHECKLIST:
1. Fill out form correctly → see thank you message
2. Check your email → receive their message
3. Leave fields empty → see error messages
4. Submit twice fast → handles gracefully

Ready?
```

### You Approve
"Yes!"

### AI Executes (Phase 2: Coding)
Builds everything from the PRP, following the specification exactly.

---

## PRP Quality Checklist

AI must ensure PRP includes:

**Required Sections**:
- [ ] Goal (1-2 sentences, plain English)
- [ ] Why (user's reason)
- [ ] Success criteria (checkboxes)
- [ ] Context (tech stack, existing patterns)
- [ ] Implementation blueprint (detailed)
- [ ] Validation loop (automated + manual)
- [ ] Codebase intelligence (files to create/modify)

**Technical Completeness**:
- [ ] Specific file paths (not "somewhere in src")
- [ ] Exact library versions
- [ ] Database schema (if applicable)
- [ ] API endpoints with full signatures
- [ ] TypeScript types
- [ ] Error handling for all operations
- [ ] Loading states for all async operations

**Non-Coder Validation**:
- [ ] Plain English summary included
- [ ] Manual testing checklist (clickable actions)
- [ ] Expected outcomes clearly described
- [ ] Error scenarios explained
- [ ] No technical jargon in user-facing parts

**Quality Constraints** (from 03-constraints-quality.md):
- [ ] Follows Junior Dev Rule
- [ ] Keep It Boring architecture
- [ ] No clever code
- [ ] All user actions have error handling
- [ ] All async operations have loading states

---

## Integration with Workflow

### Updated Phase 1 Flow:

**Phase 1.1-1.2: Discovery & Research**
- AI interviews you (plain English questions)
- AI researches codebase

**Phase 1.3-1.5: Brainstorm & Evaluation**
- AI presents approach options (plain English)
- You choose
- AI does premortem

**Phase 1.6: PRP Generation** ← NEW
- AI generates complete technical PRP
- AI creates plain English summary

**Phase 1.7: Approval** ← ENHANCED
- You review summary (not technical PRP)
- You approve
- AI saves PRP to PROJECT-STATE.md Section 2.C

**Phase 2: Execute PRP** ← ENHANCED
- AI follows PRP specification exactly
- No more back-and-forth
- Checkpoints verify against PRP

---

## Benefits for Non-Coders

**You describe what you want** → AI handles all technical details

**Before PRP**:
- Vague requirements
- Many iterations
- Misunderstandings
- Incomplete specifications

**After PRP**:
- Complete specifications
- One-pass implementation
- Clear expectations
- Automated validation

**You never see**:
- Technical PRP details (unless you want to)
- File paths and library names
- Database schemas
- API specifications

**You only interact with**:
- Plain English questions
- Plain English summaries
- Testing checklists
- Success criteria

---

## Common Scenarios

### "I don't know what's technically possible"

**AI's job**: Offer options and explain trade-offs in plain English.

```
AI: You mentioned real-time updates. Here are the options:

Option 1: Updates every 30 seconds
- Pro: Simple, reliable
- Con: Not instant

Option 2: Live updates (WebSocket)
- Pro: Instant updates
- Con: More complex, uses more resources

Option 3: Updates when user refreshes
- Pro: Very simple
- Con: User has to manually refresh

Which fits your needs?
```

### "I'm not sure what I want yet"

**AI's job**: Start with MVP, make it easy to expand.

```
AI: Let's start with a simple version:
- Basic add/view/delete
- No fancy features yet

After you try it, we can add:
- Filtering
- Search
- Export
- Whatever you need

Sound good?
```

### "I saw this feature on another website"

**AI's job**: Reverse-engineer from description.

```
AI: Can you describe what happened when you clicked it?
You: A sidebar slid in from the right with a form.

AI: Got it. After you submitted the form, what happened?
You: The sidebar closed and I saw a success message at the top.

AI: Perfect, I can build that. Should it work the same way on mobile?
```

---

## AI Instructions for PRP Generation

When user requests a feature:

1. **Load context**: Read PROJECT-STATE.md Section 5 (learned patterns)
2. **Interview user**: Use question templates (5-10 questions max)
3. **Research codebase**: Find existing patterns to reuse
4. **Generate approaches**: Present 2-3 options in plain English
5. **Create PRP**: Complete technical specification
6. **Summarize**: Plain English summary with testing checklist
7. **Get approval**: Wait for user confirmation
8. **Execute**: Follow PRP exactly in Phase 2

**Quality gates**:
- STOP after interview (don't generate PRP without approval on approach)
- STOP after PRP summary (don't code without final approval)
- CHECK PRP completeness before proceeding to Phase 2

---

## PRP Storage

**During task**: PRP lives in PROJECT-STATE.md Section 2.C (Current Task Details)

**After task**:
- If successful (rating ≥ 4): Archive to Section 2.A (Completed Tasks)
- Extract patterns to Section 5 (SEAL Learned Patterns)
- PRP becomes reference for similar future features

---

## Success Criteria

**You know the PRP process is working when**:
- You can describe features without technical knowledge
- AI asks clarifying questions you can answer
- You understand the plain English summary
- First implementation meets your expectations
- Iterations decrease over time (SEAL learns your preferences)

**AI knows the PRP is good when**:
- All required sections complete
- Builds on first try
- Passes automated validation
- Aligns with learned patterns
- User rates task ≥ 4

---

## Next Steps

This PRP Builder Guide is loaded at start of every session:

```
Load vibecoding-os/ files including 05-prp-builder-guide.md
Read .vibecoding/PROJECT-STATE.md

I want to [describe feature].

Start with Phase 0, use PRP process in Phase 1.
```

AI will interview you, generate PRP, get approval, and execute.

**You focus on what you want. AI handles how to build it.**
