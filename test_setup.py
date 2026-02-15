#!/usr/bin/env python
# Test script to check RebeccaGest setup

import sys
print(f"Python version: {sys.version}")
print(f"Python executable: {sys.executable}")
print()

print("Testing imports...")
try:
    import setuptools
    print("✓ setuptools")
except Exception as e:
    print(f"✗ setuptools: {e}")

try:
    from pkg_resources import PkgResourcesDeprecationWarning
    print("✓ pkg_resources")
except Exception as e:
    print(f"✗ pkg_resources: {e}")
    # Try workaround
    print("  Attempting workaround...")
    try:
        import importlib.resources
        print("  ✓ Using importlib.resources instead")
    except Exception as e2:
        print(f"  ✗ importlib.resources: {e2}")

try:
    import odoo
    print("✓ odoo")
except Exception as e:
    print(f"✗ odoo: {e}")
    import traceback
    traceback.print_exc()

print("\nDone!")
