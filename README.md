# Sawmills Public Homebrew Tap

Public Homebrew formulae for Sawmills tools.

## Tap

```bash
brew tap sawmills/public-tap https://github.com/Sawmills/homebrew-public-tap
```

## Install

```bash
brew install sawmills/public-tap/sm
```

## Upgrade

```bash
brew update
brew upgrade sawmills/public-tap/sm
```

## CSV validation tool

```bash
brew install sawmills/public-tap/sawmills-csvcheck
sawmills-csvcheck -file ./service_teams.csv -lookup-key SERVICE_NAME
```

Notes:
- use the lookup column name exactly as it appears in the CSV header
- duplicate lookup keys are allowed, but the processor keeps the first matching row

## CI

- `Formula CI` runs on every pull request and push to `main`.
- `Weekly Public Install Smoke` runs weekly and validates public install:
  - `brew tap sawmills/public-tap`
  - `brew install sawmills/public-tap/sm`
  - `sm --version`
- Smoke failures open or update a GitHub issue for triage.
