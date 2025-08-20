# Use the official Ubuntu 24.04 image as the base for the Molecule test instance
FROM ubuntu:24.04

# Set environment variables to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary packages
# Python3, sudo, and openssh-server are critical for Ansible to function.
# systemd-sysv is needed for roles that manage services.
# A basic text editor like nano is useful for debugging inside the container.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        sudo \
        openssh-server \
        systemd-sysv \
        iproute2 \
        nano \
    && rm -rf /var/lib/apt/lists/*

# Clean up to reduce image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Add a non-root user for Molecule to use. 
# While Molecule can create users, this ensures a consistent base.
# Grant the user passwordless sudo access.
# Replace 'molecule_user' with a preferred user name if you wish.
RUN useradd -m -s /bin/bash molecule_user \
    && echo "molecule_user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/molecule_user \
    && chmod 0440 /etc/sudoers.d/molecule_user

# Configure SSH for remote connections.- This allows Molecule to connect to the container and run commands.

RUN mkdir -p /run/sshd && sed -i 's/^#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/^PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Set the default command to keep the container running.
# Molecule's Docker driver will handle starting and stopping the container,
# but it needs a running process to attach to.
CMD ["/sbin/init"]
