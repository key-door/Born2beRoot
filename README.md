# Server Setup Project

This project involves setting up your first server by adhering to specific rules. Debian's latest stable version was chosen as the operating system for this project.

## Tasks Undertaken

- Created two or more encrypted partitions using LVM.
- Configured the ssh service.
- Set up the UFW firewall.
- Changed the hostname.
- Implemented a robust password policy.
- Installed and configured sudo following strict guidelines.
- In addition to the root user, a user with your login as the username is present. This user belongs to the `user42` and `sudo` groups.

### Strong Password Policy

To establish a robust password policy, the following criteria were met:

- Passwords expire every 30 days.
- A minimum of 2 days is required before modifying a password.
- Users receive a warning 7 days before their password expires.
- Passwords must:
  - Be at least 10 characters long.
  - Contain an uppercase letter, a lowercase letter, and a number.
  - Not have more than 3 consecutive identical characters.
  - Exclude the username.
- Except for the root password: The password must have at least 7 characters different from the previous password.
- The root password adheres to this policy.

### Sudo Group Configuration

For the sudo group, the configuration abides by the following:

- Sudo authentication is limited to 3 attempts for incorrect passwords.
- A custom error message is displayed for wrong sudo passwords.
- All sudo actions, both inputs, and outputs, are archived in the `/var/log/sudo/` folder.
- TTY mode is enabled for added security.
- Sudo usable paths are restricted, e.g., `/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin`.

## Monitoring Script (`monitoring.sh`)

Upon server startup, this script will display the following information on all terminals every 10 minutes:

- OS architecture and kernel version.
- Number of physical processors.
- Number of virtual processors.
- Available RAM and its usage rate (percentage).
- Available memory and its usage rate (percentage).
- Processor usage rate (percentage).
- Date and time of the last reboot.
- LVM activation status.
- Number of active connections.
- Number of users on the server.
- Server's IPv4 and MAC addresses.
- Number of commands executed with sudo.

