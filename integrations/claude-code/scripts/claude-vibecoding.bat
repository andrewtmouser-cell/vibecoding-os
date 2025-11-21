@echo off
REM Vibecoding OS CLI Wrapper for Windows
REM Usage: scripts\claude-vibecoding.bat [command] [args...]

setlocal enabledelayedexpansion

set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%.."
set "PROJECT_STATE=%PROJECT_ROOT%\.vibecoding\PROJECT-STATE.md"

REM Main command dispatcher
if "%1"=="" goto help
if /i "%1"=="init" goto init
if /i "%1"=="task" goto task
if /i "%1"=="triage" goto triage
if /i "%1"=="status" goto status
if /i "%1"=="patterns" goto patterns
if /i "%1"=="validate" goto validate
if /i "%1"=="metrics" goto metrics
if /i "%1"=="phase" goto phase
if /i "%1"=="help" goto help
if /i "%1"=="-h" goto help
if /i "%1"=="--help" goto help
goto unknown_command

:help
echo.
echo Vibecoding OS CLI - Run Vibecoding workflow from command line
echo.
echo USAGE:
echo   scripts\claude-vibecoding.bat [command] [args...]
echo.
echo COMMANDS:
echo   init                    Initialize PROJECT-STATE.md from template
echo   task [description]      Start a new task
echo   triage [request]        Run triage classification on a request
echo   status                  Show current project status
echo   patterns                Show learned SEAL patterns
echo   validate [file]         Validate file against quality constraints
echo   metrics                 Show project metrics and success rate
echo   phase [number]          Show details about a specific phase
echo   help                    Show this message
echo.
echo EXAMPLES:
echo   scripts\claude-vibecoding.bat init
echo   scripts\claude-vibecoding.bat task "Add a login form"
echo   scripts\claude-vibecoding.bat triage "Change button color"
echo   scripts\claude-vibecoding.bat validate src\components\Button.tsx
echo   scripts\claude-vibecoding.bat patterns
echo.
goto :eof

:check_project_state
if not exist "%PROJECT_STATE%" (
  echo.
  echo [!] No PROJECT-STATE.md found
  echo Run: scripts\claude-vibecoding.bat init
  echo.
  exit /b 1
)
exit /b 0

:init
if exist "%PROJECT_STATE%" (
  echo.
  echo [X] PROJECT-STATE.md already exists at:
  echo     %PROJECT_STATE%
  echo.
  echo To reinitialize, delete it first:
  echo     del "%PROJECT_STATE%"
  echo.
  exit /b 1
)

if not exist "%PROJECT_ROOT%\.vibecoding" mkdir "%PROJECT_ROOT%\.vibecoding"
copy "%PROJECT_ROOT%\templates\PROJECT-STATE.md" "%PROJECT_STATE%" >nul

echo.
echo [OK] PROJECT-STATE.md initialized
echo      Location: %PROJECT_STATE%
echo.
echo Next steps:
echo   1. Edit PROJECT-STATE.md with your project details
echo   2. Run: scripts\claude-vibecoding.bat status
echo.
goto :eof

:task
call :check_project_state
if errorlevel 1 goto :eof

set "TASK_DESC=%*"
set "TASK_DESC=!TASK_DESC:task =!"

if "!TASK_DESC!"=="" (
  echo.
  echo [X] Provide a task description
  echo Usage: scripts\claude-vibecoding.bat task [description]
  echo.
  exit /b 1
)

echo.
echo =========================================
echo New Task Started
echo =========================================
echo.
echo Description: !TASK_DESC!
echo.
echo Next steps in your AI chat:
echo.
echo   1. Load system:
echo      /vibecoding
echo.
echo   2. Run triage:
echo      /triage !TASK_DESC!
echo.
echo   3. Follow workflow phases
echo.
echo =========================================
echo.
goto :eof

:triage
call :check_project_state
if errorlevel 1 goto :eof

set "REQUEST=%*"
set "REQUEST=!REQUEST:triage =!"

if "!REQUEST!"=="" (
  echo.
  echo [X] Provide a request to triage
  echo Usage: scripts\claude-vibecoding.bat triage [request]
  echo.
  exit /b 1
)

echo.
echo =========================================
echo Phase 0: TRIAGE
echo =========================================
echo.
echo Request: !REQUEST!
echo.

REM Simple heuristic triaging
echo !REQUEST! | findstr /i "color style spacing padding margin font text label copy typo spelling rename variable" >nul
if %errorlevel%==0 (
  echo Classification: TRIVIAL
  echo.
  echo Reasoning:
  echo   - Visual/text-only change
  echo   - No architecture modifications needed
  echo   - Single file likely affected
  echo.
  echo Next Step: Skip to Phase 2 ^(Coding^)
) else (
  echo Classification: COMPLEX
  echo.
  echo Reasoning:
  echo   - New feature or structural change
  echo   - Multiple files likely affected
  echo   - Requires planning and risk analysis
  echo.
  echo Next Step: Initiate Phase 1 ^(Planning^)
)

echo.
echo =========================================
echo.
goto :eof

:status
call :check_project_state
if errorlevel 1 goto :eof

echo.
echo =========================================
echo Project Status
echo =========================================
echo.

REM Extract key info from PROJECT-STATE.md
for /f "tokens=1,* delims=:" %%a in ('findstr /b "**Project" "%PROJECT_STATE%"') do (
  set "line=%%b"
  set "line=!line:**=!"
  set "line=!line: =!"
  if not "!line!"=="" echo Project:      !line!
)

for /f "tokens=1,* delims=:" %%a in ('findstr /b "**Status" "%PROJECT_STATE%"') do (
  set "line=%%b"
  set "line=!line:**=!"
  set "line=!line: =!"
  if not "!line!"=="" echo Status:       !line!
)

for /f "tokens=1,* delims=:" %%a in ('findstr /b "**Current.Task" "%PROJECT_STATE%"') do (
  set "line=%%b"
  set "line=!line:**=!"
  if not "!line!"=="" echo Current Task: !line!
)

for /f "tokens=1,* delims=:" %%a in ('findstr /b "**Current.Phase" "%PROJECT_STATE%"') do (
  set "line=%%b"
  set "line=!line:**=!"
  if not "!line!"=="" echo Current Phase:!line!
)

echo.
echo =========================================
echo.
echo View full state: type "%PROJECT_STATE%"
echo.
goto :eof

:patterns
call :check_project_state
if errorlevel 1 goto :eof

echo.
echo =========================================
echo SEAL Learned Patterns
echo =========================================
echo.

REM Find and display Section 5 from PROJECT-STATE.md
findstr /n "## 5. SEAL LEARNED PATTERNS" "%PROJECT_STATE%" >nul
if %errorlevel%==0 (
  for /f "tokens=*" %%a in ('findstr /n "^" "%PROJECT_STATE%"') do (
    echo %%a | findstr "## 5. SEAL" >nul
    if !errorlevel!==0 set found=1
    if defined found echo %%a
    echo %%a | findstr "^[0-9]*:## [0-9]" >nul
    if !errorlevel!==0 if not "%%a"=="## 5." set found=
  )
) else (
  echo No patterns section found in PROJECT-STATE.md
)

echo.
echo =========================================
echo.
goto :eof

:validate
call :check_project_state
if errorlevel 1 goto :eof

set "FILE_PATH=%2"
if "!FILE_PATH!"=="" (
  echo.
  echo [X] Provide a file path
  echo Usage: scripts\claude-vibecoding.bat validate [file]
  echo.
  exit /b 1
)

if not exist "!FILE_PATH!" (
  echo.
  echo [X] File not found: !FILE_PATH!
  echo.
  exit /b 1
)

echo.
echo =========================================
echo Code Quality Check
echo =========================================
echo.
echo File: !FILE_PATH!
echo.

set /a checks_passed=0
set /a checks_failed=0
set /a checks_warned=0

REM Check 1: console.log statements
findstr /n "console\.log" "!FILE_PATH!" >nul 2>&1
if %errorlevel%==0 (
  echo [X] console.log statements found ^(remove before production^)
  findstr /n "console\.log" "!FILE_PATH!" 2>nul | findstr /n "^" | findstr "^[1-5]:"
  set /a checks_failed+=1
) else (
  echo [OK] No console.log statements
  set /a checks_passed+=1
)

REM Check 2: TODO/FIXME comments
findstr /n "TODO FIXME XXX" "!FILE_PATH!" >nul 2>&1
if %errorlevel%==0 (
  echo [!] TODO/FIXME comments found
  findstr /n "TODO FIXME XXX" "!FILE_PATH!" 2>nul | findstr /n "^" | findstr "^[1-5]:"
  set /a checks_warned+=1
) else (
  echo [OK] No TODO/FIXME comments
  set /a checks_passed+=1
)

REM Check 3: var usage
findstr /n /r "^[ 	]*var " "!FILE_PATH!" >nul 2>&1
if %errorlevel%==0 (
  echo [X] 'var' keyword found ^(use const/let instead^)
  findstr /n /r "^[ 	]*var " "!FILE_PATH!" 2>nul | findstr /n "^" | findstr "^[1-5]:"
  set /a checks_failed+=1
) else (
  echo [OK] No 'var' usage ^(using const/let^)
  set /a checks_passed+=1
)

REM Check 4: Empty catch blocks
findstr /r "catch.*{[ 	]*}" "!FILE_PATH!" >nul 2>&1
if %errorlevel%==0 (
  echo [X] Empty catch blocks found ^(handle errors properly^)
  set /a checks_failed+=1
) else (
  echo [OK] No empty catch blocks
  set /a checks_passed+=1
)

echo.
echo =========================================
echo Summary: !checks_passed! passed, !checks_failed! failed, !checks_warned! warnings
echo.

if !checks_failed! gtr 0 (
  echo Review and fix issues before marking task complete.
  exit /b 1
)

goto :eof

:metrics
call :check_project_state
if errorlevel 1 goto :eof

echo.
echo =========================================
echo Project Metrics
echo =========================================
echo.

for /f "tokens=1,* delims=:" %%a in ('findstr "Total.Tasks" "%PROJECT_STATE%"') do (
  set "line=%%b"
  echo Total Tasks:    !line!
)

for /f "tokens=1,* delims=:" %%a in ('findstr "Success.Rate" "%PROJECT_STATE%"') do (
  set "line=%%b"
  echo Success Rate:   !line!
)

for /f "tokens=1,* delims=:" %%a in ('findstr "Average.Iterations" "%PROJECT_STATE%"') do (
  set "line=%%b"
  echo Avg Iterations: !line!
)

echo.
echo =========================================
echo.
goto :eof

:phase
set "PHASE_NUM=%2"
if "!PHASE_NUM!"=="" set "PHASE_NUM=help"

echo.
echo =========================================

if "!PHASE_NUM!"=="0" (
  echo Phase 0: TRIAGE
  echo =========================================
  echo.
  echo Purpose: Classify request as TRIVIAL or COMPLEX
  echo.
  echo Classification:
  echo   - TRIVIAL: Visual/text change, skip to Phase 2
  echo   - COMPLEX: New feature/architecture, go to Phase 1
  echo.
  echo Next: Phase 1 ^(if COMPLEX^) or Phase 2 ^(if TRIVIAL^)
) else if "!PHASE_NUM!"=="1" (
  echo Phase 1: PLANNING
  echo =========================================
  echo.
  echo Subphases:
  echo   1.1 Discovery - Ask outcome-focused questions
  echo   1.2 Research - Check existing code patterns
  echo   1.3 Brainstorm - Present 3 approaches
  echo   1.4 Evaluation - Score and recommend approach
  echo   1.5 Premortem - Identify risks before building
  echo   1.6 Specification - Create implementation plan
  echo   1.7 Approval - Get user GO signal
  echo.
  echo Key: STOP ^& WAIT after each subphase
  echo Next: Phase 2 ^(Coding^) after approval
) else if "!PHASE_NUM!"=="2" (
  echo Phase 2: CODING
  echo =========================================
  echo.
  echo Subphases:
  echo   2.1 Scaffolding - Create file structure
  echo   2.2 Connectivity - Test with dummy data
  echo   2.3 Core Logic - Implement features
  echo   2.4 UI Binding - Connect to real data
  echo.
  echo Key: Check after each step ^(compile, run, verify^)
  echo Next: Phase 3 ^(Testing^)
) else if "!PHASE_NUM!"=="3" (
  echo Phase 3: TESTING
  echo =========================================
  echo.
  echo Subphases:
  echo   3.1 Manual Walkthrough - Test happy paths
  echo   3.2 Edge Case Testing - Test risks from premortem
  echo   3.3 Fix ^& Verify - Fix bugs, verify fixes work
  echo.
  echo Key: Create test steps ^(action → expected outcome^)
  echo Next: Phase 4 ^(Review^)
) else if "!PHASE_NUM!"=="4" (
  echo Phase 4: REVIEW
  echo =========================================
  echo.
  echo Subphases:
  echo   4.1 Code Audit - Clean code, remove console.log
  echo   4.2 Documentation - Update docs if needed
  echo   4.3 SEAL Learning - Rate task, update patterns
  echo.
  echo Key: User rates 1-5, AI learns from rating
  echo Next: Ready for next task
) else (
  echo Workflow Phases
  echo =========================================
  echo.
  echo Phase 0: Triage - Classify as TRIVIAL or COMPLEX
  echo Phase 1: Planning - Discovery through Approval ^(7 subphases^)
  echo Phase 2: Coding - Scaffolding through UI Binding ^(4 subphases^)
  echo Phase 3: Testing - Manual testing and fixes ^(3 subphases^)
  echo Phase 4: Review - Audit, docs, and SEAL learning ^(3 subphases^)
  echo.
  echo Usage: scripts\claude-vibecoding.bat phase [0-4]
)

echo.
echo =========================================
echo.
goto :eof

:unknown_command
echo.
echo [X] Unknown command: %1
echo.
goto help

:eof
