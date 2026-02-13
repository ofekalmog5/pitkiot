#!/bin/bash

# This script regenerates a working Xcode project

echo "Regenerating Xcode project..."

# Backup the old project
mv HebrewAlias.xcodeproj HebrewAlias.xcodeproj.backup

# Create a new Xcode project using Swift Package Manager's project generation
# We'll create a Package.swift file temporarily
cat > Package.swift << 'EOF'
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HebrewAlias",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "HebrewAlias", targets: ["HebrewAlias"])
    ],
    targets: [
        .target(
            name: "HebrewAlias",
            path: "HebrewAlias",
            resources: [.process("Resources")]
        )
    ]
)
EOF

# Generate Xcode project from Package.swift
swift package generate-xcodeproj

# Restore the Package.swift approach won't work for an iOS app...
# Let me use xcodebuild to create from scratch
rm Package.swift

echo "Creating new Xcode project..."
# We need to do this differently - let me create the project manually

