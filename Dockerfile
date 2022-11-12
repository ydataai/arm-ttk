# PowerShell Core Image
# https://hub.docker.com/_/microsoft-powershell
FROM mcr.microsoft.com/powershell:lts-alpine-3.10

#Install Git
RUN apk add git

#Clone ARM-TTK Repo
RUN git clone https://github.com/Azure/arm-ttk.git /arm-ttk

RUN git --git-dir /arm-ttk/.git --no-pager log --pretty=format:'%h' -n 1

# Copies your code file from your action repository to the filesystem path `/` of the container.
COPY entrypoint.sh /entrypoint.sh

# Set the missing exec permission, just in case if you're on on a *nix. 
RUN chmod +x ./entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
