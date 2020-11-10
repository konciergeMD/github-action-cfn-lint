FROM python:3.8-alpine


LABEL name="github-action-cfn-lint"
LABEL version="1.0.0"
LABEL repository="http://github.com/konciergeMD/github-action-cfn-lint"
LABEL homepage="http://github.com/konciergeMD/github-action-cfn-lint"

LABEL maintainer="Toga <toga@accolade.com>"
LABEL com.github.actions.name="github-action-cfn-lint"
LABEL com.github.actions.description="Run cfn-lint Check on a GitHub pull request"
LABEL com.github.actions.icon="git-pull-request"
LABEL com.github.actions.color="blue"

RUN apk add jq curl

RUN pip install cfn-lint
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
