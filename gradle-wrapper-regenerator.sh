#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Check if Gradle is installed
if ! command -v gradle &> /dev/null; then
  echo "Gradle is not installed. Please install Gradle to proceed."
  exit 1
fi

# Initiate the Gradle structure
echo "Initiating Gradle structure..."
gradle init

# Generate the Gradle wrapper files
echo "Generating Gradle wrapper files..."
gradle wrapper

# Grant executable permissions to gradlew
echo "Granting executable permissions to gradlew..."
chmod +x gradlew

# Stage all the newly generated Gradle wrapper files
echo "Adding Gradle wrapper files to the repository..."
git add gradlew gradlew.bat gradle/wrapper/gradle-wrapper.properties gradle/wrapper/gradle-wrapper.jar

# Commit the changes
echo "Committing changes..."
git commit -m "Regenerate Gradle wrapper files"

echo "Gradle wrapper files successfully regenerated and added to the repository."
