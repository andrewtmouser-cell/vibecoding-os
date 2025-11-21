# Triage Classification

Classify the user's request as TRIVIAL or COMPLEX per Phase 0 in [01-workflow-protocol.md](../../core/01-workflow-protocol.md).

## Process:

1. **Check learned patterns first**:
   - Load [PROJECT-STATE.md](../../../.vibecoding/PROJECT-STATE.md) Section 5.B.1 (Triage Patterns)
   - Check if request matches any learned trivial/complex indicators

2. **Classify using Phase 0 rules**:
   - TRIVIAL: Visual-only change, text update, simple style tweak
   - COMPLEX: New feature, architecture change, multi-file modification

3. **Output format**:
   ```
   Phase 0: TRIAGE - Classification: [TRIVIAL/COMPLEX]

   Reasoning: [Why this classification]

   Next Step: [Skip to Phase 2 / Initiate Phase 1]
   ```

## Usage:

User types: `/triage` followed by their request
Result: Quick classification with next step recommendation
