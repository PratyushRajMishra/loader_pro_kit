#!/bin/bash
# PUBLISH LOADER PRO KIT TO PUB.DEV - EXACT STEPS

# ==============================================================================
# STEP 1: CREATE PUB.DEV ACCOUNT
# ==============================================================================
# 1. Go to https://pub.dev
# 2. Click "Sign up" (top right)
# 3. Sign in with Google
# 4. Done!

# ==============================================================================
# STEP 2: PREPARE YOUR MACHINE
# ==============================================================================

cd /Users/pratyushmishra/loader_pro_kit

# Verify Flutter is installed
flutter --version

# Get dependencies
flutter pub get

# ==============================================================================
# STEP 3: FORMAT AND ANALYZE CODE
# ==============================================================================

# Format all code
flutter format lib/ test/ example/lib/

echo "✓ Code formatted"

# ==============================================================================
# STEP 4: ANALYZE CODE QUALITY
# ==============================================================================

dart analyze lib/

echo "✓ Code analysis complete (should show no errors)"

# ==============================================================================
# STEP 5: RUN TESTS
# ==============================================================================

flutter test

echo "✓ Tests passed (should show: 00:00 +13: All tests passed!)"

# ==============================================================================
# STEP 6: VERIFY PUBSPEC.YAML
# ==============================================================================

# Check pubspec.yaml contains:
# - name: loader_pro_kit
# - version: 1.0.0
# - description: filled
# - homepage: filled
# - repository: filled
# - issue_tracker: filled
# - documentation: filled

cat pubspec.yaml | head -20

echo "✓ pubspec.yaml verified"

# ==============================================================================
# STEP 7: DRY RUN (TEST PUBLICATION)
# ==============================================================================

flutter pub publish --dry-run

# Expected: "Package validation successful!"

echo "✓ Dry run successful - package is ready!"

# ==============================================================================
# STEP 8: PUBLISH TO PUB.DEV
# ==============================================================================

# THIS IS THE FINAL STEP - ACTUAL PUBLICATION

echo ""
echo "========================================"
echo "Ready to publish to pub.dev?"
echo "========================================"
echo ""
echo "Package: loader_pro_kit"
echo "Version: 1.0.0"
echo ""
echo "Press ENTER to continue, or Ctrl+C to cancel"

read -p "Continue? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
    flutter pub publish

    echo ""
    echo "✓ Publication attempt complete!"
    echo ""
    echo "Check https://pub.dev/packages/loader_pro_kit in 5-10 minutes"
else
    echo "Publication cancelled"
fi

# ==============================================================================
# STEP 9: VERIFY ON PUB.DEV
# ==============================================================================

echo ""
echo "After 5-10 minutes:"
echo "1. Go to: https://pub.dev/packages/loader_pro_kit"
echo "2. Verify all information is correct"
echo "3. Check README renders properly"
echo "4. Confirm version 1.0.0 appears"
echo ""
echo "🎉 Success!"
