# Constraints & Quality Guardrails

**These rules apply 100% of the time. NEVER violate them.**

---

## Global Constraints

### 1. No "Clever" Code

**Rule**: Write code that a junior developer could read and understand immediately.

**Why**: The user can't debug complex code. If AI can't explain it in plain English, don't write it.

**Examples**:

❌ **FORBIDDEN**:
```javascript
const f = (x) => x.reduce((a, b) => ({...a, [b.k]: b.v}), {});
```

✅ **REQUIRED**:
```javascript
function convertArrayToObject(items) {
  const result = {};
  for (const item of items) {
    result[item.key] = item.value;
  }
  return result;
}
```

---

### 2. Explicit > DRY

**Rule**: It's better to repeat 3 lines of code in two files than to create a complex shared dependency.

**Why**: Non-technical users can understand repeated code. They can't untangle complex abstractions.

**Examples**:

❌ **BAD** (Over-abstracted):
```javascript
// lib/form-helpers.ts
export const createFormHandler = (validator, submitter, errorHandler) => {
  return async (data) => {
    try {
      if (!validator(data)) throw new Error('Invalid');
      await submitter(data);
    } catch (e) {
      errorHandler(e);
    }
  };
};

// component1.tsx
const handleSubmit = createFormHandler(validateLogin, submitLogin, showError);

// component2.tsx
const handleSubmit = createFormHandler(validateSignup, submitSignup, showError);
```

✅ **GOOD** (Explicit):
```javascript
// component1.tsx
async function handleLoginSubmit(data) {
  try {
    if (!validateLogin(data)) {
      showError('Invalid login credentials');
      return;
    }
    await submitLogin(data);
  } catch (error) {
    showError(error.message);
  }
}

// component2.tsx
async function handleSignupSubmit(data) {
  try {
    if (!validateSignup(data)) {
      showError('Invalid signup data');
      return;
    }
    await submitSignup(data);
  } catch (error) {
    showError(error.message);
  }
}
```

**When DRY is OK**:
- Utilities that are truly universal (`formatDate`, `validateEmail`)
- Already established abstractions in the project
- Shared components with clear purposes (`Button`, `Input`)

---

### 3. The "Keep It Boring" Architecture

**Rule**: Default to monoliths. Avoid orchestration complexity.

#### 3.1: Default to Monoliths

✅ **PREFER**:
- One repo
- One backend
- One frontend
- Example: Next.js (frontend + API routes in one codebase)

❌ **AVOID** unless explicitly required:
- Microservices
- Separate frontend/backend repos
- Service meshes
- Message queues

#### 3.2: Avoid "Glue"

❌ **DO NOT SUGGEST** unless user explicitly demands:
- Docker Compose with 5+ services
- Kubernetes
- Complex CI/CD pipelines
- Service discovery
- API gateways

✅ **USE INSTEAD**:
- Run locally with `npm run dev`
- Deploy to Vercel/Netlify (simple)
- Use platform defaults

#### 3.3: Standard Libraries

✅ **PREFER**:
- React (not Solid/Qwik/Fresh)
- Express or Next.js API routes (not Hono/Fastify)
- PostgreSQL (not EdgeDB/SurrealDB)
- Established libraries with 10K+ GitHub stars

❌ **AVOID**:
- Beta features
- Experimental frameworks
- Bleeding edge libraries
- "Better" alternatives to established tools

---

### 4. Communication Style

**Rule**: Explain technical choices using non-technical analogies.

**Examples**:

❌ **BAD**:
```
"I'll use a Redux store with thunks for async state management,
 implementing the flux pattern with unidirectional data flow."
```

✅ **GOOD**:
```
"I'll use Redux to manage your app's data. Think of it like a
 filing cabinet where all your app's information lives. When
 something changes, Redux updates the cabinet and tells all the
 parts of your app that care about that information."
```

**Always**:
- Use analogies (filing cabinet, recipe, assembly line)
- Explain "why" before "how"
- Avoid acronyms without explanation
- Compare to real-world concepts

---

### 5. Phase Declaration

**Rule**: ALWAYS state which Phase/Subphase you are currently in at the start of your response.

**Format**:
```
Phase X.Y: [PHASE NAME]
```

**Examples**:
- "Phase 0: TRIAGE"
- "Phase 1.2: RESEARCH"
- "Phase 2.3: CORE LOGIC"
- "Phase 4.1: CODE AUDIT"

**Why**: User needs to know where we are in the process. Maintains methodical approach.

---

## Coding Constraints

### 6. All User Actions Must Have Error Handling

**Rule**: Every button click, form submission, API call must handle errors.

❌ **FORBIDDEN**:
```javascript
async function handleSubmit() {
  const result = await api.post('/login', data);
  redirect('/dashboard');
}
```

✅ **REQUIRED**:
```javascript
async function handleSubmit() {
  try {
    const result = await api.post('/login', data);
    redirect('/dashboard');
  } catch (error) {
    showError('Login failed. Please check your credentials.');
    console.error('Login error:', error);
  }
}
```

---

### 7. All Async Operations Must Have Loading States

**Rule**: If something takes time, show the user it's happening.

❌ **FORBIDDEN**:
```javascript
<button onClick={handleSubmit}>Login</button>
```

✅ **REQUIRED**:
```javascript
<button onClick={handleSubmit} disabled={isLoading}>
  {isLoading ? 'Logging in...' : 'Login'}
</button>
```

---

### 8. Error Messages in Plain English

**Rule**: Error messages must tell the user what happened AND what to do.

❌ **BAD**:
```
"ERR_NETWORK_FAILURE"
"Uncaught TypeError"
"500 Internal Server Error"
"Validation failed"
```

✅ **GOOD**:
```
"No internet connection. Please check your network and try again."
"Please enter a valid email address."
"Something went wrong on our end. Please try again in a moment."
"Email and password are required."
```

**Format**:
```
[What happened] + [What to do about it]
```

---

### 9. Descriptive Variable Names

**Rule**: Variable names should describe their purpose, not their type.

❌ **BAD**:
```javascript
const arr = [];
const obj = {};
const fn = () => {};
const data = fetchData();
const temp = x * 2;
```

✅ **GOOD**:
```javascript
const userList = [];
const userSettings = {};
const calculateTotal = () => {};
const userData = fetchUserData();
const doubledValue = x * 2;
```

---

### 10. Functions Should Do One Thing

**Rule**: If a function name needs "and" in it, split it.

❌ **BAD**:
```javascript
function validateAndSubmitForm(data) {
  if (!isValid(data)) return false;
  api.post('/submit', data);
  redirect('/success');
  updateCache(data);
}
```

✅ **GOOD**:
```javascript
function validateForm(data) {
  return isValid(data);
}

async function submitForm(data) {
  await api.post('/submit', data);
}

function handleFormSuccess(data) {
  updateCache(data);
  redirect('/success');
}

// Usage
if (validateForm(data)) {
  await submitForm(data);
  handleFormSuccess(data);
}
```

---

## Code Organization Constraints

### 11. File Length Limit

**Rule**: No file over 300 lines. Split into multiple files if needed.

**Why**: Long files are hard to navigate and understand.

**How to Split**:
- Extract helper functions to separate files
- Split components into smaller components
- Separate concerns (logic, UI, state)

---

### 12. No Magic Numbers

**Rule**: Don't hardcode numbers without explanation.

❌ **BAD**:
```javascript
if (users.length > 50) { ... }
setTimeout(callback, 3000);
```

✅ **GOOD**:
```javascript
const MAX_USERS_PER_PAGE = 50;
if (users.length > MAX_USERS_PER_PAGE) { ... }

const THREE_SECONDS = 3000;
setTimeout(callback, THREE_SECONDS);
```

---

### 13. Comments Explain "Why", Not "What"

**Rule**: Code should be self-explanatory. Comments explain reasoning.

❌ **BAD**:
```javascript
// Loop through users
for (const user of users) {
  // Check if user is active
  if (user.isActive) {
    // Add to list
    activeUsers.push(user);
  }
}
```

✅ **GOOD**:
```javascript
// We only send notifications to active users to avoid bounces
for (const user of users) {
  if (user.isActive) {
    activeUsers.push(user);
  }
}
```

**When to comment**:
- Business logic decisions
- Why a specific approach was chosen
- Known limitations or gotchas
- References to external documentation

**When NOT to comment**:
- What the code does (should be obvious)
- Restating the code in English

---

## Emergency Rules

### 14. If an Error Occurs

**Rule**: Do NOT rewrite the whole file. Provide only the specific change/diff.

**Why**: Rewriting risks introducing new bugs. Surgical fixes are safer.

**Format**:
```
In file: src/components/Login.tsx

Change line 45 from:
  const result = await api.post('/login', data);

To:
  const result = await api.post('/login', data).catch(handleError);
```

---

### 15. If a Fix Fails Twice

**Rule**: ROLLBACK to the last working state and try a simpler approach.

**Why**: Repeatedly trying the same complex fix wastes time. Simplify.

**Process**:
1. First attempt fails → Try fix
2. Second attempt fails → STOP
3. Restore last working code
4. Propose simpler alternative
5. Get user approval
6. Implement simpler fix

---

## Quality Checklist (Phase 4.1)

Before declaring "done", verify:

**Code Quality**:
- [ ] Readable by junior developer?
- [ ] No console.log in production code?
- [ ] No TODO comments without issues?
- [ ] No unused variables/imports?
- [ ] No commented-out code?

**Error Handling**:
- [ ] All user actions have try/catch?
- [ ] All API calls handle errors?
- [ ] Error messages in plain English?
- [ ] Error messages actionable?

**Loading States**:
- [ ] All async operations show loading?
- [ ] Buttons disabled during submission?
- [ ] Loading text is clear?

**Naming**:
- [ ] Variables descriptive?
- [ ] Functions do one thing?
- [ ] Files named clearly?

**Architecture**:
- [ ] Following "boring" principle?
- [ ] No unnecessary abstractions?
- [ ] Matches established patterns?

**Documentation**:
- [ ] README updated?
- [ ] Complex logic commented?
- [ ] PROJECT-STATE.md updated?

---

## Enforcement

These constraints are **NOT NEGOTIABLE** unless:

1. User explicitly requests deviation (document why)
2. External library requires it (explain in comments)
3. Established codebase pattern contradicts it (note in PROJECT-STATE.md)

**If unsure**: Follow the constraint. It's designed for non-technical builders who can't recover from complex code.

---

## Philosophy

**These constraints exist because**:

1. **Vibecoders can't debug** → Need simple, clear code
2. **AI context resets** → Need explicit, not clever
3. **Projects must be maintainable** → Need boring, not exciting
4. **Errors must be handled** → User can't fix crashes
5. **Process must be visible** → User needs to understand progress

**Result**: Code that works, lasts, and can be modified by future AI (or future developers).

---

**When in doubt, ask**: "Could a junior developer understand this?"

If yes → proceed.
If no → simplify.
