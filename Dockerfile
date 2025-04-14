FROM registry.access.redhat.com/ubi9/ubi-minimal

USER root

# Copy the llamafile binary
COPY granite-3.2-8b-instruct-Q4_K_M.llamafile /usr/local/bin/llamafile

RUN curl -o /usr/local/bin/ape https://cosmo.zip/pub/cosmos/bin/ape-$(uname -m).elf && \
    chown 0:0 /usr/local/bin/llamafile && \
    chown 0:0 /usr/local/bin/ape && \
    chmod 554 /usr/local/bin/ape && \
    chmod 554 /usr/local/bin/llamafile && \
    microdnf install -y gcc

# Expose the default port used by llamafile (e.g., 8080 or 8000)
EXPOSE 8080

# Start the llamafile server
CMD ["/usr/local/bin/ape", "/usr/local/bin/llamafile","--server","--host","0.0.0.0","--port","8080","--nobrowser","-ngl","999"]

