# centos-ssh Docker Container

Before starting the ssh daemon, the entry point script copies an `authorized_keys` file that can be mounted externally as a volume to `/`, into `/root/.ssh`. This enables dynamic key generation without rebuilding the container.


