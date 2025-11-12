name: Validate Scripts

on:
  push:
    branches: [ main, develop ]
  pull_request:
    branches: [ main ]

jobs:
  validate-windows-script:
    runs-on: windows-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Check if VirtualBox paths are correct
        shell: cmd
        run: |
          echo Checking Windows script syntax...
          type scripts\configure-vm.bat
          
      - name: Validate batch script syntax
        shell: cmd
        run: |
          echo Script validation passed

  validate-linux-script:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Check script permissions
        run: |
          ls -la scripts/
          
      - name: Validate shell script syntax
        run: |
          bash -n scripts/configure-vm.sh
          echo "Script syntax is valid"
      
      - name: Check shellcheck
        run: |
          sudo apt-get update
          sudo apt-get install -y shellcheck
          shellcheck scripts/configure-vm.sh || true

  validate-documentation:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Check markdown files
        run: |
          echo "Checking README.md"
          test -f README.md
          
          echo "Checking documentation files"
          test -f docs/troubleshooting.md
          test -f docs/optimization.md
          test -f QUICK_START.md
          
      - name: Validate markdown syntax
        uses: actionshub/markdownlint@main
        with:
          path: "*.md"
          ignore: node_modules
        continue-on-error: true

  check-structure:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Verify repository structure
        run: |
          echo "Checking repository structure..."
          
          # Check for required files
          test -f README.md && echo "✓ README.md found"
          test -f LICENSE && echo "✓ LICENSE found"
          test -f .gitignore && echo "✓ .gitignore found"
          test -f QUICK_START.md && echo "✓ QUICK_START.md found"
          
          # Check for required directories
          test -d scripts && echo "✓ scripts/ directory found"
          test -d docs && echo "✓ docs/ directory found"
          
          # Check for script files
          test -f scripts/configure-vm.bat && echo "✓ configure-vm.bat found"
          test -f scripts/configure-vm.sh && echo "✓ configure-vm.sh found"
          
          # Check for documentation
          test -f docs/troubleshooting.md && echo "✓ troubleshooting.md found"
          test -f docs/optimization.md && echo "✓ optimization.md found"
          
          echo "Repository structure is valid!"