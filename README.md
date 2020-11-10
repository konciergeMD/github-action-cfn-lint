# github-action-cfn-lint
A Github Action that runs a [cfn-lint](https://github.com/aws-cloudformation/cfn-python-lint) check on a pull request and leaves a comment on your pull request.

## Example

#### Create `.github/workflows/cfn-lint.yml`:
```
on: [pull_request]
name: AWS CloudFormation Template Check
jobs:
  cfn-lint:
    name: cfn-lint
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: cfn-lint
      uses: konciergeMD/github-action-cfn-lint@main
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        #PRECOMMAND_MESSAGE: You have style errors. See them below.
        #CFNLINT_OPTS: ""  # optional: additional cfn-lint options
```

#### Create a `.cfnlintrc.yml` config in your project's root directory:
```
templates:
- template.y*ml
include_checks:
- I
```

#### Additional options
* `PRECOMMAND_MESSAGE` - if you set it, it will print before
the code errors. For example, this is helpful if you want to print a message to refer the user
to any tools you have for managing style errors.
* `CFNLINT_OPTS` - in case you don't want to use the `.cfnlintrc.yml` configuration file, use this variable to set additional `cfn-lint` options
