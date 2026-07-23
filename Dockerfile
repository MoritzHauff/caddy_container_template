FROM caddy:latest

# Install git
RUN apk add --no-cache git

# Build arguments
ARG GITHUB_REPO
ARG DOMAIN

# Make them available as environment variables
ENV GITHUB_REPO=${GITHUB_REPO}
ENV DOMAIN=${DOMAIN}

# Clone the repository
RUN git clone "${GITHUB_REPO}" /opt/site

# Remove /srv directory
RUN rm -r /srv

# Create the symlink expected by Caddy
RUN ln -s /opt/site/public /srv

# Generate the Caddy configuration
RUN printf '%s\n' \
    "${DOMAIN} {" \
    "    root * /srv" \
    "    file_server {" \
    "         hide .git" \
    "    }" \
    "}" \
    > /etc/caddy/Caddyfile

# EXPOSE 80
# EXPOSE 443
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 443/udp

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

