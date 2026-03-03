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

## CI

- `Formula CI` runs on every pull request and push to `main`.
- `Weekly Public Install Smoke` runs weekly and validates public install:
  - `brew tap sawmills/public-tap`
  - `brew install sawmills/public-tap/sm`
  - `sm --version`
- Smoke failures open or update a GitHub issue for triage.
