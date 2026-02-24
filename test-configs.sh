#!/usr/bin/env bash

# NixOS Configuration Test Script
# Tests all host configurations to ensure they build successfully

set -e

# Color output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Hosts to test
HOSTS=("thinkbook" "thinkpad" "xps" "nano")

# Track results
PASSED=()
FAILED=()

echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo -e "${BLUE}    NixOS Configuration Test Suite${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo ""

# Function to print test status
print_status() {
    local status=$1
    local message=$2
    if [ "$status" == "PASS" ]; then
        echo -e "${GREEN}✓${NC} $message"
    elif [ "$status" == "FAIL" ]; then
        echo -e "${RED}✗${NC} $message"
    elif [ "$status" == "INFO" ]; then
        echo -e "${BLUE}ℹ${NC} $message"
    elif [ "$status" == "WARN" ]; then
        echo -e "${YELLOW}⚠${NC} $message"
    fi
}

# Test 1: Flake Check
echo -e "${YELLOW}[1/2]${NC} Running flake check..."
if nix flake check 2>&1 | tee /tmp/flake-check.log; then
    print_status "PASS" "Flake check passed"
    FLAKE_CHECK_PASSED=true
else
    print_status "FAIL" "Flake check failed (see /tmp/flake-check.log for details)"
    FLAKE_CHECK_PASSED=false
fi
echo ""

# Test 2: Build all host configurations
echo -e "${YELLOW}[2/2]${NC} Building all host configurations..."
echo ""

for host in "${HOSTS[@]}"; do
    echo -e "  ${BLUE}Testing${NC} $host..."

    if nix build ".#nixosConfigurations.$host.config.system.build.toplevel" --no-link 2>&1 | tee "/tmp/build-$host.log"; then
        print_status "PASS" "$host configuration builds successfully"
        PASSED+=("$host")
    else
        print_status "FAIL" "$host configuration failed to build (see /tmp/build-$host.log for details)"
        FAILED+=("$host")
    fi
    echo ""
done

# Summary
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo -e "${BLUE}    Test Summary${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo ""

# Flake check summary
if [ "$FLAKE_CHECK_PASSED" = true ]; then
    print_status "PASS" "Flake check: PASSED"
else
    print_status "FAIL" "Flake check: FAILED"
fi
echo ""

# Build summary
echo "Host Configurations:"
echo -e "  ${GREEN}Passed:${NC} ${#PASSED[@]}/${#HOSTS[@]}"
if [ ${#PASSED[@]} -gt 0 ]; then
    for host in "${PASSED[@]}"; do
        echo -e "    ${GREEN}✓${NC} $host"
    done
fi

if [ ${#FAILED[@]} -gt 0 ]; then
    echo -e "  ${RED}Failed:${NC} ${#FAILED[@]}/${#HOSTS[@]}"
    for host in "${FAILED[@]}"; do
        echo -e "    ${RED}✗${NC} $host"
    done
fi

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════${NC}"
echo ""

# Exit with error if any tests failed
if [ ${#FAILED[@]} -gt 0 ] || [ "$FLAKE_CHECK_PASSED" = false ]; then
    echo -e "${RED}Some tests failed. Check logs in /tmp/ for details.${NC}"
    exit 1
else
    echo -e "${GREEN}All tests passed! Configuration is ready to deploy.${NC}"
    exit 0
fi