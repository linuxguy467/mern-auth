FROM gitpod/workspace-full

ENV NODE_VERSION="18.18.0"
RUN sudo install-packages shellcheck tree llvm
RUN bash -c 'source $HOME/.nvm/nvm.sh && nvm install ${NODE_VERSION} \
    && nvm use ${NODE_VERSION} && nvm alias default ${NODE_VERSION}'
