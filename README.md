# Learning Docker with AI: Day 1 - Hello World with Alpine

This project marks Day 1 of my Docker learning journey, guided by AI and rooted in secure, lean engineering principles.

## Goal
Set up and run a basic container using Alpine Linux with a focus on:
- Security best practices (e.g., non-root user, restricted privileges)
- Minimalism (lightweight image, no unnecessary layers)
- Fast learning and iteration with the help of AI

---

## Dockerfile Overview
- **Base Image**: `alpine:3.21.3` (avoiding `latest` to reduce potential issues)
- **Non-root Execution**: Adds a custom group and user for better security
- **Script Execution**: Copies a shell script (`hello.sh`) into the container and runs it with correct permissions
- **Lean Entrypoint**: Uses ENTRYPOINT to execute the script directly

## Docker Compose (Security-First Setup)
```yaml
services:
  hello:
    build: .
    read_only: true  # Enforces read-only filesystem
    restart: "no"
    security_opt:
      - no-new-privileges:true  # Prevents privilege escalation
    tmpfs:
      - /tmp  # Temporary directory in memory
