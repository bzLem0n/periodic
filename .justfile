# List availble recipes
default:
  @just --list


# Format the flake using nix fmt
[group('flake')]
format:
  nix fmt .

# Enter a nix repl shell for the flake
[group('flake')]
repl:
  nix repl -f flake:nixpkgs

# Update flake lockfile
[group('flake')]
update:
  nix --option commit-lockfile-summary "chore: update flake.lock" flake update --commit-lock-file


# Update localhost
[group('localhost')]
clean:
  nh clean all

# List generations availble in the nix store
[group('localhost')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Upgrade a host
[group('localhost')]
[group('remote host')]
upgrade hostname="":
  {{ if hostname == "" { "nh os boot" } \
    else \
    { "nh os boot --target-host kcrook@" + quote(hostname) + " .#" + quote(hostname) } \
  }}
