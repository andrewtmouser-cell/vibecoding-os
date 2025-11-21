---
description: Run automated validation and tests
---

# Run Automated Validation

Load vibecoding-os/06-automated-validation.md
Read .vibecoding/PROJECT-STATE.md Section 2.C for current PRP

Run automated validation following 06-automated-validation.md:

## Level 1: Build & Quality Checks

Run the following and report results:
```bash
# Build check
npm run build

# Type check (if TypeScript)
npm run type-check

# Lint check
npm run lint

# Check for console errors in running app
```

Report each result as:
✅ PASS or ❌ FAIL with plain English explanation

If any fail, fix issues and re-run.

## Level 2: Functional Tests

Check if tests exist:
- Unit tests in /tests/unit/ or /src/**/*.test.*
- Integration tests
- E2E tests

If tests exist, run them:
```bash
npm run test
```

Report results:
```
✅ X tests passed
⏱ Y seconds
📊 Z% code coverage
```

If no tests exist but should (based on PRP):
1. Explain what tests are missing
2. Offer to create them
3. Wait for approval

## Level 3: Manual Testing Checklist

Generate manual testing checklist based on:
- PRP Success Criteria (Section 2.C)
- Feature type
- Edge cases identified

Present checklist in plain English:
```
Manual Testing Checklist:

Basic Operations:
[ ] [Action] → [Expected result]
[ ] [Action] → [Expected result]

Edge Cases:
[ ] [Scenario] → [Expected result]

Visual Check:
[ ] Responsive design (mobile/desktop)
[ ] Loading states visible
[ ] Error messages clear
```

Wait for user to complete manual testing.

## Test Summary

Provide confidence score and recommendation:
```
Test Confidence: X/10

Breakdown:
- Automated coverage: X/10
- Edge cases: X/10
- Manual validation: pending/completed

Recommendation: [Safe to deploy / Needs more testing / Issues to fix]
```

If issues found:
1. List issues clearly
2. Explain what you'll fix
3. Fix them
4. Re-run validation
