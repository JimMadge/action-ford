# FORD docker action

This action builds documentation for a Fortran project using
[FORD](https://github.com/Fortran-FOSS-Programmers/ford). The documentation can
then be deployed using an action such as [GitHub
Page](https://github.com/marketplace/actions/github-pages).

## Example usage

name: Docs

on: push

jobs:
  publish:
  runs-on: ubuntu-latest
  steps:
    - name: Checkout
      uses: actions/checkout@v1
    - name: Build
      uses: JimMadge/ford-action@v1
    - name: Deploy
      if: success()
      uses: crazy-max/ghaction-github-pages@v1
      with:
        target_branch: gh-pages
        build_dir: doc
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
