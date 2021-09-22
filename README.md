# Termius hosts farm

Repository with Docker containers with ssh servers.

## Supported authentication options:

- only identity file;
- only password;
- [authy](https://www.authy.com) and identity file;
- [authy](https://www.authy.com) and password;
- one time password;
- YubiKey with methods: public key (GPG), keyboard-interactive (PAM);

## Run

To run ssh/telnet servers you'll demand on [Docker](https://www.docker.com)
and [docker-compose](https://pypi.python.org/pypi/docker-compose).

```bash
docker-compose up
```

## How to add more options

When you want to add new server configuration follow step below:

- create new configuration directory with **meaningful** Name in repository root;
- add `Dockerfile` and to new configuration directory;
- add new service with the same configuration name to `docker-compose.yml`;
- use environment variable in `docker-compose.yml` where it's needed.

## Table of available hosts

|               Service                |          Port           |    User     |  Password   |                                        Key                                        |
|:------------------------------------:|:-----------------------:|:-----------:|:-----------:|:---------------------------------------------------------------------------------:|
|                 pass                 |          2201           |     sa      |    pass     |                                         -                                         |
|                 key                  |          2202           |     sa      |      -      |     [rsa key](/keys/id_rsa) <br/> [encrypted rsa key](/keys/id_rsa_encrypted)     |
|               authykey               |          2203           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|              authypass               |          2204           | Authy users | authy_token |                                         -                                         |
|                 otp                  |          2205           |     sa      |      -      |                               [keys](/otp/keys.txt)                               |
|               ed25519                |          2206           |     sa      |      -      |                          [ed25519 key](/keys/id_ed25519)                          |
|            ecdsa-nistp256            |          2207           |     sa      |      -      |                     [ecDSA 256 key](/keys/id_ecdsa_nistp256)                      |
|            ecdsa-nistp384            |          2218           |     sa      |      -      |                     [ecDSA 384 key](/keys/id_ecdsa_nistp384)                      |
|            ecdsa-nistp521            |          2219           |     sa      |      -      |                     [ecDSA 521 key](/keys/id_ecdsa_nistp521)                      |
|            hmac-sha2-256             |          2208           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|            hmac-sha2-512             |          2209           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|   chacha20-poly1305_at_openssh.com   |          2210           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|              aes128-ctr              |          2211           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|              aes192-ctr              |          2212           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|              aes256-ctr              |          2213           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|          curve25519-sha256           |          2214           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
| diffie-hellman-group-exchange-sha256 |          2215           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|                telnet                |          2216           |     sa      |    pass     |                                         -                                         |
|                chain1                |          2217           |   chain1    |      1      |                                         -                                         |
|                chain2                |            -            |   chain2    |      -      |                              [rsa key](/keys/id_rsa)                              |
|                chain3                |            -            |   chain3    |      -      |                             [rsa1 key](/keys/id_rsa1)                             |
|               yuubikey               |          2220           |     sa      |      -      |                                         -                                         |
|             yuubikey-pam             |          2221           |     sa      |      -      |                                         -                                         |
|      agent-forwarding-disabled       |          2222           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|            gateway-ports             |          2223           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|                 mosh                 | 2224, 60001-60010 (udp) |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|            multiple-auths            |          2225           |     sa      |    pass     |                              [rsa key](/keys/id_rsa)                              |
|      keyboard-interactive-pass       |          2226           |     sa      |    pass     |                                         -                                         |
|            sftp-disabled             |          2227           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|             pf-disabled              |          2228           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|             pf-case-jump             |          2230           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|             client-cert              |          2231           |     sa      |      -      |                   [user certificate key](/client-cert/user-key)                   |
|            mosh-unstable             | 2232, 60021-60030 (udp) |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|              mosh-pass               | 2233, 60011-60020 (udp) |     sa      |    pass     |                                         -                                         |
|              export-key              |          2234           |     sa      |    pass     |                                         -                                         |
|           disabled-rsa-sha           |          2235           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|             dropbear-key             |          2236           |     sa      |      -      |                              [rsa key](/keys/id_rsa)                              |
|                putty                 |          2237           |     sa      |      -      | [putty key](/keys/putty_rsa)<br/>[encrypted putty key](/keys/putty_rsa_encrypted) |
|               tinyssh                |          2238           |     sa      |      -      |                          [ed25519 key](/keys/id_ed25519)                          |


Passphrase for [`keys/id_rsa_encrypted`](/keys/id_rsa_encrypted) is `termius-test`.

Passphrase for [`keys/putty_rsa_encrypted`](/keys/putty_rsa_encrypted) is `test`.

### Table of proxy hosts

|         Hostname         | Port | Availability | Proxied hosts |
|:------------------------:|:----:|:------------:|:-------------:|
|        http-proxy        | 8888 |    global    |   pass, key   |
|    http-proxy-chain1     | 8889 |    global    |    chain1     |
| http-proxy-authenticated | 8890 |    global    |   pass, key   |
|    http-proxy-chain2     | 3128 | from chain1  |    chain2     |
|    http-proxy-chain3     | 3128 | from chain2  |    chain3     |

HTTP proxy `http-proxy-authenticated` credentials are username `termius` and password `test`.

### Table of Port Forwarding Case

|              Hostname               | Port |    Availability    |                Authentication                 |
|:-----------------------------------:|:----:|:------------------:|:---------------------------------------------:|
| pf-case-keystorage, 172.25.1.101/24 |  22  | from the jump host |      [ed25519 key](/keys/id_ed25519.pub)      |
|   pf-case-target, 172.25.2.101/24   |  22  | from the jump host | get a key from pf-case-keystorage `~/.id_rsa` |

