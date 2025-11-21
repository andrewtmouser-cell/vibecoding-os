# Workflow Protocol

**CRITICAL**: AI must operate in ONE phase at a time. Never skip ahead.

---

## PHASE 0: TRIAGE

**Purpose**: Classify the request and route to appropriate workflow.

### Step 1: Classify Request

Analyze the user's request and classify as:

**TRIVIAL** if:
- Change visual styling (colors, spacing, fonts)
- Fix typos or update text
- Add/update comments or documentation
- Rename variables following established patterns
- Simple configuration changes

**COMPLEX** if:
- New features or functionality
- Bug fixes requiring investigation
- Refactoring code structure
- "Why isn't this working?" questions
- Architecture or design decisions
- Database changes
- API integrations

### Step 2: Check Learned Patterns

Before deciding:
1. Load `.vibecoding/PROJECT-STATE.md`
2. Check Section: "Triage Patterns"
3. Match request against known trivial/complex indicators
4. Apply pattern if confidence ≥ 0.8

### Step 3: Route

**If TRIVIAL**:
```
State: "Phase 0: TRIAGE - Classification: TRIVIAL"
Action: Skip to Phase 2 (Coding)
Reason: [Brief explanation]
```

**If COMPLEX**:
```
State: "Phase 0: TRIAGE - Classification: COMPLEX"
Action: Initiate Phase 1 (Planning)
Reason: [Brief explanation]
```

### Step 4: Log Task

Add entry to PROJECT-STATE.md Section 5.A.2:

```markdown
### Task #[N]: [Task Description]
- **Date**: YYYY-MM-DD
- **Type**: [Feature / Bug Fix / Refactor / Setup]
- **Status**: Planned
- **Phase**: 0 (Triage)
- **Classification**: [Trivial / Complex]
```

---

## PHASE 1: PLANNING

**Purpose**: Understand, design, and specify the work before writing code.

**STOP & WAIT after each subphase.**

---

### **Phase 1.1: DISCOVERY**

**Purpose**: Interview the user to gather requirements.

**State at start**: "Phase 1.1: DISCOVERY"

#### What to Do:

1. **Check learned patterns first**:
   - Load PROJECT-STATE.md Section 5.B.2: "Discovery Patterns"
   - Use questions that worked before
   - Avoid questions that confused user

2. **Ask outcome-focused questions**:
   - What should happen when...?
   - Who will use this feature?
   - What devices/platforms need to work?
   - Are there any constraints? (time, budget, tech)

3. **Avoid technical jargon questions**:
   - ❌ "What state management do you prefer?"
   - ❌ "REST or GraphQL?"
   - ❌ "Which database engine?"

4. **Gather**:
   - **Requirements**: What must it do?
   - **Constraints**: What limitations exist?
   - **Must-Haves**: What's critical vs nice-to-have?

#### Output Format:

```markdown
## Discovery Summary

**Requirements**:
- [Requirement 1]
- [Requirement 2]

**Constraints**:
- [Constraint 1]
- [Constraint 2]

**Must-Haves**:
- [Critical feature 1]
- [Critical feature 2]

**Nice-to-Haves**:
- [Optional feature 1]
```

**Then**: *STOP & WAIT for user confirmation.*

---

### **Phase 1.2: RESEARCH**

**Purpose**: Check existing codebase for patterns and standards.

**State at start**: "Phase 1.2: RESEARCH"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.3: "Research Patterns"
   - Load PROJECT-STATE.md Section 5.C: "Project Structure Map"
   - Use known file locations for this task type

2. **For this task type, check**:
   - **New Feature**: Similar existing features, API patterns, component structure
   - **Bug Fix**: The buggy file, related test files, recent git commits
   - **UI Task**: Existing components, styling approach, design system
   - **API Task**: Existing API routes, error handling, authentication patterns

3. **Identify**:
   - Existing patterns to follow
   - Standard libraries in use
   - Naming conventions
   - File structure conventions
   - Code style preferences

4. **Document findings**:
   - Which files are relevant
   - Which patterns to follow
   - Which conventions to match

#### Output Format:

```markdown
## Research Findings

**Relevant Existing Code**:
- [File path]: [What it does, why relevant]

**Patterns to Follow**:
- [Pattern 1]: [Example from codebase]

**Tech Stack**:
- [Library/Framework]: [How it's used]

**Conventions Discovered**:
- File naming: [Convention]
- Component structure: [Convention]
- Styling: [Approach used]
```

**Then**: *STOP & WAIT for user confirmation.*

---

### **Phase 1.3: BRAINSTORM (Architecture)**

**Purpose**: Propose multiple approaches, including a simple one.

**State at start**: "Phase 1.3: BRAINSTORM"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.4: "Architecture Preferences"
   - Note which approaches user picked before
   - Note what user values (simplicity, features, etc.)

2. **Generate 3 approaches**:
   - **Approach 1: Simple/Monolith** (REQUIRED)
   - **Approach 2: Moderate**
   - **Approach 3: Complex/Feature-Rich**

3. **For each approach, describe**:
   - High-level overview
   - What files need to be created/modified
   - Estimated complexity (Low/Medium/High)
   - Pros and cons

#### Output Format:

```markdown
## Proposed Approaches

### Approach 1: Simple/Monolith ⭐
**Overview**: [Simple description]

**Implementation**:
- [Step 1]
- [Step 2]

**Pros**:
- Easy to understand
- Fast to implement
- [Other pros]

**Cons**:
- [Con 1]
- [Con 2]

**Complexity**: Low

---

### Approach 2: Moderate
[Same format]

---

### Approach 3: Complex
[Same format]
```

**Then**: *STOP & WAIT for user to choose.*

---

### **Phase 1.4: EVALUATION (The Vibe Check)**

**Purpose**: Score approaches and recommend one.

**State at start**: "Phase 1.4: EVALUATION"

#### What to Do:

1. **Score each approach on**:
   - **Simplicity** (1-5): Can a junior dev understand it?
   - **Reliability** (1-5): Will it work consistently?
   - **Vibecodability** (1-5): Can an AI fix it later if it breaks?

2. **Calculate total score** for each approach

3. **Recommend** the highest-scoring approach

4. **Default bias**: Simple/Monolith approach unless complex has significantly higher score

#### Output Format:

```markdown
## Evaluation

| Approach | Simplicity | Reliability | Vibecodability | Total |
|----------|-----------|-------------|----------------|-------|
| 1: Simple | 5 | 4 | 5 | 14 |
| 2: Moderate | 3 | 4 | 3 | 10 |
| 3: Complex | 2 | 5 | 2 | 9 |

**Recommendation**: Approach 1 (Simple/Monolith)

**Reasoning**:
[Why this approach is best for this user's needs]
```

**Then**: *STOP & WAIT for user approval/override.*

---

### **Phase 1.5: PREMORTEM (The Shield)**

**Purpose**: Assume the plan FAILED. Identify risks BEFORE they happen.

**State at start**: "Phase 1.5: PREMORTEM"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.D: "Actual Risks Encountered"
   - Prioritize risks that ACTUALLY happened in this project
   - Deprioritize theoretical risks that never occurred

2. **Assume the implementation failed**. Brainstorm why:
   - Edge cases (empty data, missing fields, network offline)
   - API limits (rate limits, timeouts, auth failures)
   - User errors (wrong input, rapid clicking, closing browser mid-process)
   - Performance (large data sets, slow devices, memory limits)
   - Browser/device issues (mobile viewport, old browsers)

3. **For each risk, provide**:
   - What could go wrong
   - How likely (High/Medium/Low)
   - Mitigation strategy

#### Output Format:

```markdown
## Premortem Analysis

**Assumption**: The implementation FAILED. Here's why:

### Risk 1: [Description]
- **Likelihood**: High
- **Impact**: [What breaks]
- **Mitigation**: [How to prevent/handle]

### Risk 2: [Description]
- **Likelihood**: Medium
- **Impact**: [What breaks]
- **Mitigation**: [How to prevent/handle]

[Continue for all risks]

**Risks that actually occurred in this project before**:
- [Risk from Section 5.D]
- [Risk from Section 5.D]
```

**Then**: *STOP & WAIT for user to review risks.*

---

### **Phase 1.6: SPECIFICATION (The Blueprint)**

**Purpose**: Create detailed implementation plan (Product Requirement Prompt).

**State at start**: "Phase 1.6: SPECIFICATION"

**IMPORTANT**: For non-technical users, use the **PRP Builder process** from `05-prp-builder-guide.md`. This section explains the traditional specification format, but the PRP Builder provides a structured way to generate complete technical specifications through conversation.

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.C: "Project Structure Map"
   - Load PROJECT-STATE.md Section 5.B: Relevant coding patterns
   - Load PROJECT-STATE.md Section 4.B: Codebase Intelligence
   - Match established conventions

2. **Generate PRP (Product Requirement Prompt)**:
   - Use the interview process from `05-prp-builder-guide.md`
   - Translate user's plain English requirements into technical specification
   - Include all elements: Goal, Success Criteria, Context, Implementation Blueprint, Validation

3. **Create detailed specification** (or use PRP format):

#### Output Format:

```markdown
## Implementation Specification

### File Tree
```
Exact files to create/modify:

src/
  components/
    NewComponent/
      index.tsx          [CREATE]
      styles.module.css  [CREATE]
      types.ts           [CREATE]
  lib/
    api.ts               [MODIFY - add new endpoint]
```
```

### Data Flow
```
Input → [Process 1] → [Process 2] → Output

1. User clicks button
2. Form data validated
3. API call to /api/endpoint
4. Response processed
5. UI updated
```

### Function Signatures

```typescript
// No implementation yet, just signatures

function handleSubmit(data: FormData): Promise<void>

interface FormData {
  field1: string;
  field2: number;
}

function validateInput(data: FormData): boolean
```

### Implementation Steps (Phase 2)

1. Scaffolding: Create file structure
2. Connectivity: Hardcoded dummy data test
3. Core Logic: Implement validation and API call
4. UI Binding: Connect form to real data

**Save PRP**: Update PROJECT-STATE.md Section 2.C with the complete PRP for reference during implementation.

**Then**: *STOP & WAIT for user review.*

---

### **Phase 1.7: APPROVAL**

**Purpose**: Get explicit approval to proceed to coding.

**State at start**: "Phase 1.7: APPROVAL"

#### What to Do:

**If using PRP process**: Present plain English summary (see `05-prp-builder-guide.md` Stage 5)

Ask explicitly:

```markdown
## Ready to Code?

I've planned:
- [Brief summary of approach]
- [File count to create/modify]
- [Estimated complexity]
- Testing checklist: [X manual tests you'll perform]

**Are you confident this plan solves the problem with minimal future headaches?**

Type 'GO' to start Phase 2 (Coding).
Or provide feedback to adjust the plan.
```

**Then**: *WAIT for 'GO' or feedback.*

**If feedback**: Return to appropriate Phase 1 subphase and revise.

---

## PHASE 2: CODING

**Purpose**: Implement the specification step-by-step.

**State at start**: "Phase 2: CODING"

**CRITICAL**: Check after EVERY step. "Always be compiling."

---

### **Phase 2.1: SCAFFOLDING**

**Purpose**: Create structure before writing logic.

**State at start**: "Phase 2.1: SCAFFOLDING"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.5: "Coding Style Patterns"
   - Load PROJECT-STATE.MD Section 5.C: "Project Structure Map"
   - Match established file structure

2. **Create directory structure** per specification

3. **Install dependencies** (if needed):
   - Use preferred package manager (check Section 5.B.5)
   - Add to package.json

4. **Create placeholder files**:
   - TypeScript interfaces/types only
   - Function signatures (no body)
   - Import statements
   - Comments for TODOs

#### Example:

```typescript
// Component placeholder
import React from 'react';
import styles from './styles.module.css';

interface LoginFormProps {
  onSubmit: (data: FormData) => void;
  // TODO: Add other props
}

export function LoginForm(props: LoginFormProps) {
  // TODO: Implement component
  return <div>Placeholder</div>;
}
```

#### Check:

```markdown
**Scaffolding Check**:
Did the environment setup without errors?
- [ ] Directories created
- [ ] Dependencies installed (npm install succeeded)
- [ ] Placeholder files compile/run
```

**If errors**: Fix before proceeding.

**Then**: *WAIT for user confirmation scaffolding works.*

---

### **Phase 2.2: CONNECTIVITY (The "Hello World")**

**Purpose**: Verify the "pipes" work BEFORE adding complex logic.

**State at start**: "Phase 2.2: CONNECTIVITY"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.9: "Dummy Data Preferences"
   - Load PROJECT-STATE.md Section 5.B.5: "Logging Preferences"

2. **Connect frontend to backend with HARDCODED DUMMY DATA**:
   - Use realistic dummy data (not "foo", "bar")
   - Example: "John Doe", "test@example.com"

3. **Add console.logs** with descriptive messages:
   - ✅ "User submitted form with data: {data}"
   - ❌ "Debug point 3"

4. **Test the connection**:
   - Click button → See log
   - API call → See request/response
   - State update → See UI change

#### Example:

```typescript
export function LoginForm(props: LoginFormProps) {
  const handleSubmit = () => {
    // HARDCODED DUMMY DATA
    const dummyData = {
      email: "test@example.com",
      password: "dummy-password"
    };

    console.log("Form submitted with:", dummyData);
    props.onSubmit(dummyData);
  };

  return (
    <form onSubmit={handleSubmit}>
      <button>Login</button>
    </form>
  );
}
```

#### Check:

```markdown
**Connectivity Check**:
Click the button. Did you see the log/alert?
- [ ] Console log appears
- [ ] Data flows through system
- [ ] No errors in console
```

**If issues**: Fix before adding real logic.

**Then**: *WAIT for user confirmation connectivity works.*

---

### **Phase 2.3: CORE LOGIC**

**Purpose**: Implement the actual functionality.

**State at start**: "Phase 2.3: CORE LOGIC"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.5: "Coding Style Patterns"
   - Check for similar implemented features
   - Match variable naming, error handling patterns

2. **Implement math/data processing functions**:
   - Follow established patterns
   - Use descriptive variable names
   - Add error handling
   - Keep functions small and focused

3. **Add logging immediately**:
   - Log inputs and outputs
   - Log decision points
   - Use descriptive messages

4. **Write unit tests OR console.log tests**:
   - Test happy path
   - Test edge cases
   - Verify error handling

#### Example:

```typescript
function validateEmail(email: string): boolean {
  console.log("Validating email:", email);

  if (!email || email.trim() === "") {
    console.log("Validation failed: empty email");
    return false;
  }

  const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const isValid = emailPattern.test(email);

  console.log("Email validation result:", isValid);
  return isValid;
}
```

#### Check:

```markdown
**Core Logic Check**:
Does the logic handle the data correctly?
- [ ] Happy path works
- [ ] Edge cases handled
- [ ] Errors caught and logged
- [ ] Console logs show correct flow
```

**Then**: *WAIT for user confirmation logic works.*

---

### **Phase 2.4: UI BINDING**

**Purpose**: Replace dummy data with real data and add styling.

**State at start**: "Phase 2.4: UI BINDING"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.8: "UI Patterns"
   - Match component structure to existing
   - Use established styling approach

2. **Replace dummy data with real data**:
   - Connect to actual API calls
   - Bind to form inputs
   - Use real state management

3. **Add CSS/Styling**:
   - Match existing design system
   - Follow established patterns (CSS Modules, Tailwind, etc.)
   - Ensure responsive design

4. **Add Loading States**:
   - Show spinner/skeleton during async operations
   - Disable buttons during submission
   - Match existing loading patterns

5. **Add Error Messages**:
   - Plain English (not technical)
   - Actionable (tell user what to do)
   - Match existing error display pattern (toast, inline, modal)

#### Example:

```typescript
export function LoginForm(props: LoginFormProps) {
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();
    setIsLoading(true);
    setError(null);

    try {
      const formData = new FormData(e.target);
      const email = formData.get('email') as string;
      const password = formData.get('password') as string;

      if (!validateEmail(email)) {
        throw new Error("Please enter a valid email address");
      }

      await props.onSubmit({ email, password });
    } catch (err) {
      setError(err.message);
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className={styles.form}>
      <input name="email" type="email" placeholder="Email" />
      <input name="password" type="password" placeholder="Password" />

      {error && <div className={styles.error}>{error}</div>}

      <button disabled={isLoading}>
        {isLoading ? "Logging in..." : "Login"}
      </button>
    </form>
  );
}
```

#### Check:

```markdown
**UI Binding Check**:
Does it look right and behave correctly?
- [ ] Real data flows through
- [ ] Styling matches existing components
- [ ] Loading states work
- [ ] Error messages are clear
- [ ] Responsive on mobile
```

**Then**: Run automated validation (see `06-automated-validation.md`):
- Build check
- Type check
- Code quality check
- Automated tests (if available)

Report results in plain English. Fix any failures before proceeding to Phase 3.

**Then**: *WAIT for user confirmation UI works.*

---

### **CODING EMERGENCY RULES**

If an error occurs during Phase 2:

1. **DO NOT rewrite the whole file**
   - Provide only the specific change/diff
   - Explain what's changing and why

2. **If a fix fails TWICE**:
   - ROLLBACK to last working state
   - Try a simpler approach
   - Document why first approach failed

3. **Document the issue**:
   - Add to PROJECT-STATE.md Section 5.D: "Bugs Fixed"
   - Note solution for future reference

---

## PHASE 3: TESTING

**Purpose**: Verify the implementation works before declaring "done".

**State at start**: "Phase 3: TESTING"

**IMPORTANT**: Use automated validation process from `06-automated-validation.md` for all testing phases. This provides:
- Level 1: Build & quality checks (automated)
- Level 2: Functional tests (automated)
- Level 3: Manual testing checklist (user performs)

---

### **Phase 3.1: AUTOMATED TESTING**

**Purpose**: Run automated checks and tests before manual testing.

**State at start**: "Phase 3.1: AUTOMATED TESTING"

#### What to Do:

Follow `06-automated-validation.md` process:

1. **Run Level 1 checks** (Build & Quality):
   - Build check
   - Type check (if TypeScript)
   - Lint check
   - Console error check

2. **Run Level 2 checks** (Functional Tests):
   - Unit tests
   - Integration tests
   - E2E tests (if available)

3. **Report results in plain English**:
   - ✅ "All 23 tests passed"
   - ❌ "Found 2 issues, fixing now..."

4. **Fix any failures** and re-run until all pass

**Then**: Generate manual testing checklist for Phase 3.2

---

### **Phase 3.2: MANUAL WALKTHROUGH**

**Purpose**: Provide step-by-step test script for user.

**State at start**: "Phase 3.2: MANUAL WALKTHROUGH"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.6: "Testing Preferences"
   - Use test format that worked before
   - Match user's testing style

2. **Create numbered test steps**:
   - Clear actions ("Click X", "Enter Y")
   - Expected outcomes ("Expect to see Z")
   - Include screenshots for UI changes

#### Output Format:

```markdown
## Manual Test Script

**Setup**:
1. Open browser to http://localhost:3000
2. Clear cookies/localStorage

**Test Steps**:

**Step 1**: Navigate to login page
- Action: Click "Login" in header
- Expected: Login form appears

**Step 2**: Submit with valid credentials
- Action: Enter "test@example.com" and "password123"
- Action: Click "Login" button
- Expected: See loading spinner
- Expected: Redirect to dashboard after 1-2 seconds

**Step 3**: Check error handling
- Action: Enter invalid email "notanemail"
- Action: Click "Login"
- Expected: See error message "Please enter a valid email address"
- Expected: Form still editable (not disabled)

**Success Criteria**:
- [ ] All steps passed
- [ ] No console errors
- [ ] UI looks correct
```

**Then**: *WAIT for user to test and report results.*

---

### **Phase 3.3: EDGE CASE ASSAULT**

**Purpose**: Intentionally try to break the implementation.

**State at start**: "Phase 3.3: EDGE CASE ASSAULT"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.D: "Actual Risks Encountered"
   - Focus on edge cases user actually tests
   - Reference Phase 1.5 Premortem risks

2. **Create edge case tests**:
   - Based on risks that ACTUALLY happened before
   - Skip edge cases user never tests

#### Output Format:

```markdown
## Edge Case Tests

Refer back to Phase 1.5 Premortem. Let's intentionally trigger those risks:

**Edge Case 1**: Network offline
- Action: Turn off internet
- Action: Try to login
- Expected: Error message "No internet connection. Please check your network."

**Edge Case 2**: Rapid clicking
- Action: Click "Login" button 5 times rapidly
- Expected: Button disabled after first click
- Expected: Only one API call made

**Edge Case 3**: Empty form submission
- Action: Click "Login" without entering data
- Expected: Error message "Email and password are required"

**Test these scenarios and report what breaks.**
```

**Then**: *WAIT for user edge case test results.*

---

### **Phase 3.4: FIX & REPEAT**

**Purpose**: Fix any bugs found and re-test.

**State at start**: "Phase 3.4: FIX & REPEAT"

#### What to Do:

1. **For each bug reported**:
   - Identify root cause
   - Propose fix
   - Implement fix (following Phase 2 rules)
   - Update PROJECT-STATE.md Section 5.D with bug + solution

2. **Re-run tests**:
   - Repeat Phase 3.1 for affected areas
   - Verify edge cases now pass

3. **If new bugs appear**:
   - Repeat until all tests pass

**Then**: *WAIT for confirmation all tests pass.*

---

## PHASE 4: REVIEW & REFLECTION

**Purpose**: Clean up and capture learnings.

**State at start**: "Phase 4: REVIEW & REFLECTION"

---

### **Phase 4.1: CODE AUDIT**

**Purpose**: Clean the code before declaring done.

**State at start**: "Phase 4.1: CODE AUDIT"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.5: "Coding Style Patterns"
   - Verify code matches established conventions

2. **Scan for**:
   - console.log statements (remove from production)
   - TODO comments (resolve or document)
   - Unused variables/imports
   - Commented-out code (delete)
   - Hardcoded values (move to constants/env)

3. **Verify**:
   - All functions have descriptive names
   - All variables have meaningful names
   - Error handling is complete
   - Loading states are present

#### Output:

```markdown
## Code Audit Results

**Cleaned up**:
- Removed 3 console.log statements
- Resolved 1 TODO comment
- Removed 2 unused imports

**Verified**:
- ✓ All functions well-named
- ✓ Error handling complete
- ✓ Loading states present
- ✓ No hardcoded values
```

**Then**: *Proceed to Phase 4.2*

---

### **Phase 4.2: DOCUMENTATION**

**Purpose**: Update project documentation.

**State at start**: "Phase 4.2: DOCUMENTATION"

#### What to Do:

1. **Check learned patterns**:
   - Load PROJECT-STATE.md Section 5.B.7: "Documentation Preferences"
   - Write in user's preferred style (plain English, brief, etc.)

2. **Update README.md** (or project docs):
   - Add new feature to feature list
   - Update setup instructions if needed
   - Add usage examples

3. **Keep it brief**:
   - What changed
   - How to use it
   - Known limitations (if any)

#### Output:

```markdown
## Documentation Updated

Added to README.md:

### New Feature: User Login

Users can now log in with email and password.

**Usage**:
1. Navigate to /login
2. Enter credentials
3. Click "Login"

**Features**:
- Email validation
- Error handling
- Loading states

**Known limitations**:
- Password reset not yet implemented
```

**Then**: *Proceed to Phase 4.3*

---

### **Phase 4.3: SEAL LEARNING UPDATE (CRITICAL)**

**Purpose**: Update PROJECT-STATE.md with learnings from this task.

**State at start**: "Phase 4.3: SEAL LEARNING"

**DO NOT SKIP THIS STEP.**

#### What to Do:

1. **Update Section 5.A.2: Task Log**:
   - Mark current task as completed
   - Add completion date
   - Add rating (once user provides it)
   - Note files modified
   - Add brief outcome

2. **Ask user for feedback**:

```markdown
## SEAL Learning Feedback

Quick feedback to improve future tasks:

**Rating (1-5)**: ___

**What worked well**:
-

**What could be better**:
-

**Should this become a pattern?**:
-
```

3. **If rating ≥ 4 (Successful task)**:
   - Extract what worked
   - Update relevant patterns in Section 5.B
   - Increase pattern confidence scores
   - Add new patterns if 3+ similar successful tasks

4. **If rating ≤ 3 (Needs improvement)**:
   - Note what went wrong
   - Update patterns to avoid same mistake
   - Document in Section 5.D if it's a recurring issue

5. **Update other sections as needed**:
   - Section 5.C: Project Structure (if new files/structure)
   - Section 5.D: Bugs/Risks (if new issues discovered)
   - Section 5.E: Project Rules (if new conventions emerged)

#### Example Update:

```markdown
### Task #8: Login Form
- **Date**: 2025-01-27
- **Type**: Feature
- **Status**: Completed ✅
- **Phase**: 4 (Review)
- **Rating**: 5/5
- **Files Modified**:
  - src/components/LoginForm/index.tsx (created)
  - src/components/LoginForm/styles.module.css (created)
  - src/app/login/page.tsx (modified)
- **Notes**: Successfully implemented. User loves the loading states and error handling.
- **Learned**: Always include loading states for async operations (user priority)

---

**Pattern Updated**: Form Handling (Confidence: 0.88 → 0.92)
- Added: Loading button states
- Added: Toast notifications for errors
- Confirmed: React Hook Form + Zod validation approach
```

---

## WORKFLOW SUMMARY

```
Phase 0: Triage
  ↓
[If Complex] Phase 1: Planning
  1.1 Discovery    [STOP & WAIT]
  1.2 Research     [STOP & WAIT]
  1.3 Brainstorm   [STOP & WAIT]
  1.4 Evaluation   [STOP & WAIT]
  1.5 Premortem    [STOP & WAIT]
  1.6 Specification[STOP & WAIT]
  1.7 Approval     [WAIT FOR 'GO']
  ↓
Phase 2: Coding
  2.1 Scaffolding  [CHECK]
  2.2 Connectivity [CHECK]
  2.3 Core Logic   [CHECK]
  2.4 UI Binding   [CHECK]
  ↓
Phase 3: Testing
  3.1 Manual Walkthrough
  3.2 Edge Case Assault
  3.3 Fix & Repeat
  ↓
Phase 4: Review
  4.1 Code Audit
  4.2 Documentation
  4.3 SEAL Learning [MANDATORY]
```

---

**REMEMBER**:
- ALWAYS state current phase at start of response
- NEVER skip phases
- ALWAYS stop & wait when instructed
- ALWAYS check after coding steps
- ALWAYS update PROJECT-STATE.md in Phase 4.3

**This workflow is the foundation of quality vibecoding.**
