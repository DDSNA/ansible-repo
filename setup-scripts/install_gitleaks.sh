# Get the latest release version number
GITLEAKS_VERSION=$(curl -s "https://api.github.com/repos/gitleaks/gitleaks/releases/latest" \
  | grep -Po '"tag_name": "v\K[0-9.]+' )

# Download the ARM64 tarball
wget -qO gitleaks.tar.gz \
  "https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks_${GITLEAKS_VERSION}_linux_arm64.tar.gz"

# Extract into /usr/local/bin
sudo tar -xzf gitleaks.tar.gz -C /usr/local/bin gitleaks

# Make it executable
sudo chmod +x /usr/local/bin/gitleaks

# Clean up
rm gitleaks.tar.gz

# Verify
gitleaks version
