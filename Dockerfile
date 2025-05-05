ARG TALOSCTL_VERSION

FROM ghcr.io/siderolabs/talosctl:${TALOSCTL_VERSION} as talos

FROM debian:bullseye-slim 

RUN apt-get update && \
    apt-get install -y --no-install-recommends bash ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=talos /talosctl /usr/local/bin/talosctl

ENTRYPOINT ["talosctl"]
