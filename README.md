# Purpose

This repository configures a set of machines (most likely a single machines
for now) with a `machine-setup` cookbook taking care of the machine-specific
things (packages, system configuration, etc.) and a `user-files` cookbook
taking care of users and their specific needs.

# Data bags

- A `users` data bag contains per-user configuration.
- A `secrets` encrypted data bag contains secrets.
