---
description: Show current project status and progress
---

# Project Status

Load .vibecoding/PROJECT-STATE.md

## Current Status Summary

### Active Task
From Section 2.B (Current Task):
- **Task**: [Name/description]
- **Phase**: [Current phase]
- **Started**: [Date]
- **Progress**: [What's been completed]
- **Next Step**: [What comes next]

If no active task: "No task currently in progress. Ready to start!"

### Recent Activity
From Section 2.A (Completed Tasks), show last 5:
1. [Task name] - Rating: X/5 - [Date]
2. [Task name] - Rating: X/5 - [Date]
...

### Backlog
From Section 3 (Backlog):
- **Total items**: [Count]
- **Top 3 priority items**:
  1. [Item]
  2. [Item]
  3. [Item]

### Project Health

**Task Success Rate**:
- Total completed: [X]
- Average rating: [Y]/5
- Success rate (≥4 rating): [Z]%

**Pattern Learning Progress**:
- Total learned patterns: [Count from Section 5]
- High confidence patterns (≥0.9): [Count]
- Emerging patterns (0.7-0.89): [Count]

**Code Quality**:
From Section 8 (Metrics):
- Test coverage: [X]% (if tracked)
- Known issues: [Count from Section 6]
- Technical debt: [High/Medium/Low]

**Project Maturity**: [Early/Growing/Mature]
- Early: < 10 tasks completed
- Growing: 10-30 tasks completed
- Mature: 30+ tasks completed

### Known Issues
From Section 6 (Known Issues & Risks):
If any issues exist, list top 3 by severity.
If none: "No known issues! ✅"

### Recommendations

Based on current status, suggest:
1. [Next logical task to work on]
2. [Patterns that need strengthening]
3. [Any maintenance needed]

## Quick Actions

What would you like to do?
- Start a new task: `/start-task`
- Continue current task: `/continue`
- Review learned patterns: `/review-patterns`
- Run tests: `/run-tests`
