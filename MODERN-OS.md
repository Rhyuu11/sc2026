# SC2026 Modern OS Compatibility Patch

Patched for current Debian/Ubuntu LTS-style systems, with emphasis on:
- Ubuntu 22.04 / 24.04 / 26.04 LTS
- Debian 12 / 13

## Main changes

1. Replaced obsolete `python` package assumptions with Python 3 / `python-is-python3`.
2. Package installation now skips packages removed from newer repositories instead of aborting the entire install.
3. Replaced the legacy `/etc/rc.local` boot hook with `/etc/sysctl.d/99-sc2026.conf`.
4. Made PHP-FPM configuration use the versioned `/etc/php/*/fpm/pool.d/www.conf` path.
5. Removed deprecated OpenVPN `comp-lzo` from generated client profiles and changed the bundled server profile to `compress migrate` for migration compatibility. OpenVPN recommends avoiding compression where possible.
6. Replaced the deprecated `apt-key` call with a keyring-based approach.
7. `setup.sh` now prefers the patched files bundled in this archive instead of immediately downloading the older copies from GitHub.

## Important

This is a compatibility patch, not a complete security audit or functional rewrite. The original project contains old prebuilt binaries, embedded credentials/keys, external license/authorization checks, and downloads from third-party URLs. Review those before production use.

For a fresh server, test on a disposable VM first and keep console access available.
