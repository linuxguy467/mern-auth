FROM gitpod/workspace-full

RUN sudo install-packages shellcheck tree llvm
RUN bash -c 'VERSION="18.18.0" \
    && source $HOME/.nvm/nvm.sh && nvm install $VERSION \
    && nvm use $VERSION && nvm alias default $VERSION'
