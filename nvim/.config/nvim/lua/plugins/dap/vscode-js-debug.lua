return {
  'microsoft/vscode-js-debug',
  build = 'npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out',
}
