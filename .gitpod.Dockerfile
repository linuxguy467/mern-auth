FROM gitpod/workspace-full

RUN sudo install-packages shellcheck tree llvm
RUN sudo apt -y update && sudo apt -y dist-upgrade
RUN bash -c 'VERSION="18.18.0" \
    && source $HOME/.nvm/nvm.sh && nvm install $VERSION \
    && nvm alias default $VERSION && nvm use default'
EXPOSE 5001