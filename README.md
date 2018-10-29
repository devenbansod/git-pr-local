# git-pr-local
Script to checkout any PR for local review

## Setup

```sh
source setup.sh
```

## Usage
```sh
git-pr-local <pr-number> [<remote> [<new-local-branch>]]
```

### Default values
* remote: `origin`
* new-local-branch: `pr/<pr-number>`


### Example:
* Let's assume `origin` points to the central repository, which has the issues and PRs tracker
* You want to locally checkout a PR with ID 2018 to a new local branch named `pr-local-checkout-2018` 

```sh
cd <repository_directory>
git-pr-local 2018 origin pr-local-checkout-2018
```
