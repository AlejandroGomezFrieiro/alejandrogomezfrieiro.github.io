---
title: Python CI/CD
tags:
    - python
---
1. Setup python-semantic-release
2. Generate initial Changelog.md with `semantic-release changelog`.
3. Setup `pyproject.toml`

```toml
[tool.semantic_release]
version_variable = "pyproject.toml:version" # version location
branch = "main"                             # branch to make releases of
changelog_file = "CHANGELOG.md"             # changelog file
build_command = "uv build"              # build dists
dist_path = "dist/"                         # where to put dists
upload_to_release = true                    # auto-create GitHub release
upload_to_pypi = false                      # don't auto-upload to PyPI
remove_dist = false                         # don't remove dists
patch_without_tag = true                    # patch release by default
```

4. Setup Github Actions
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
    steps:
    ...
    - name: Prepare package for release
      env:
        GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      run: |
            git config user.name github-actions
            git config user.email github-actions@github.com
            uv run semantic-release publish
    - name: Publish to TestPyPI
      uses: pypa/gh-action-pypi-publish@release/v1
      with:
        user: __token__
        password: ${{ secrets.TEST_PYPI_API_TOKEN }}
        repository_url: https://test.pypi.org/legacy/
  test:
    ...
  lint:
    ...
```
