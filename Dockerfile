FROM node:25.8.0-trixie

ENV LANG="ja_JP.UTF-8"
ENV WORKSPACE_DIR="/workspaces"
ENV USER_HOME_ROOT="/root"
ENV GEMINI_CLI_HOME="${USER_HOME_ROOT}/.gemini"
ENV GEMINI_AGENT_HOME="${USER_HOME_ROOT}/agents"
RUN npm install -g @google/gemini-cli
RUN apt update
RUN apt install -y vim tmux python3 python3-pip bash locales 
RUN locale-gen ja_JP.UTF-8
RUN mkdir -p ${WORKSPACE_DIR} ${GEMINI_CLI_HOME} ${GEMINI_AGENT_HOME}
COPY ./agents ${GEMINI_AGENT_HOME}
COPY ./settings.json ${GEMINI_CLI_HOME}/.
COPY ./.gitconfig ${USER_HOME_ROOT}/.gitconfig
WORKDIR ${WORKSPACE_DIR}
