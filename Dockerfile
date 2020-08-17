# Install PowerShell Core from scratch https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7
#FROM alpine:3.9

# RUN apk add --no-cache \
#         ca-certificates \
#         less \
#         ncurses-terminfo-base \
#         krb5-libs \
#         libgcc \
#         libintl \
#         libssl1.1 \
#         libstdc++ \
#         tzdata \
#         userspace-rcu \
#         zlib \
#         icu-libs \
#         curl \
# && apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
#     lttng-ust \
# && curl -L https://github.com/PowerShell/PowerShell/releases/download/v7.0.3/powershell-7.0.3-linux-alpine-x64.tar.gz -o /tmp/powershell.tar.gz \
# && mkdir -p /opt/microsoft/powershell/7 \
# && tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 \
# && chmod +x /opt/microsoft/powershell/7/pwsh \
# && ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh

# PowerShell Core Image
# https://hub.docker.com/_/microsoft-powershell
FROM mcr.microsoft.com/powershell:lts-alpine-3.10

# Install Git
# RUN apk add git

# Clone ARM-TTK Repo
# RUN git clone https://github.com/venura9/arm-ttk.git download

# Copies your code file from your action repository to the filesystem path `/` of the container.
COPY entrypoint.sh /entrypoint.sh

# Set the missing exec permission, just in case if you're on on a *nix. 
RUN chmod +x ./entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
