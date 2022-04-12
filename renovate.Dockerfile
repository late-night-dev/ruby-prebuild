#-------------------------
# renovate rebuild trigger
# https://www.ruby-lang.org/en/downloads/branches/
#-------------------------

# makes lint happy
FROM scratch

# EOL: 2022-03-31
# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=2.6.10

# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=2.7.6

# renovate: datasource=ruby-version depName=ruby versioning=ruby
ENV RUBY_VERSION=3.0.3
