# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]
### Added
- Change `SocksTimeout` option by setting `$SOCKS_TIMEOUT_SECONDS`

### Fixed
- upgrade default tor version: 0.4.1.6 -> 0.4.1.9
  (non-breaking, fixes only, https://gitweb.torproject.org/tor.git/plain/ChangeLog)

## [1.0.0] - 2019-10-12
### Added
- Tor Socks5 & DNS proxy

[Unreleased]: https://github.com/fphammerle/docker-tor-proxy/compare/1.0.0...HEAD
[1.0.0]: https://github.com/fphammerle/docker-tor-proxy/releases/tag/1.0.0
