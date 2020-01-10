#!/bin/bash
set -e

# Find FORD project file, assume name is project-file.md
ROOT=$(find . -name project-file.md -exec dirname {} \;)
echo "FORD project file located in ${ROOT}"

# Build documentation
echo "Building documenation"
ford ${ROOT}/project-file.md
