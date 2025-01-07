---
title: Python CI/CD
tags:
    - python
---
0. Make sure you have setup a PyPi project setup for the repo.
3. Setup Github Actions
```yaml
name: "CICD"
on:
  pull_request:
  push:
    branches:
      - main
jobs:
  publish:
    name: "Publish to Pypi"
    runs-on: "ubuntu-latest"
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    needs: [test, lint]
    permissions:
      id-token: write
      contents: write
    environment:
      name: pypi
      url: https://pypi.org/p/<package_name>
    steps:
    - uses: actions/checkout@v4
    - uses: ./.github/actions/setup
    - name: Sync environment
      run: uv sync
    - name: Prepare package for release
      env:
        GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      run: |
        git config user.name github-actions
        git config user.email github-actions@github.com
        uv build
    - name: Publish to TestPyPI
      uses: pypa/gh-action-pypi-publish@release/v1


  test:
    ...
  lint:
    ...
```
