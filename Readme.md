# 

## Build

```shell
podman build --platform linux/amd64 --tag dns-test:0.1 .
```

## Run

### Recursive to Roots

```shell
podman run --rm -d --env CONF="$(cat named-roots-only.conf)" --publish 8053:53/udp --cap-add NET_RAW --cap-add NET_ADMIN --name dns-test dns-test
podman exec -it dns-test tshark -i lo -i wlan0 -f "port 53"
```

```shell
dig @127.0.0.1 -p 8053 ads.google.com
podman stop dns-test
```

```shell
Capturing on 'Loopback: lo' and 'wlan0'
    1 0.000000000 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x8fbf A ads.google.com OPT
    2 0.000437011 192.168.0.44 ? 192.36.148.17 DNS 82 Standard query 0xa3b2 NS <Root> OPT
    3 0.000483559 192.168.0.44 ? 192.36.148.17 DNS 86 Standard query 0xd84d NS com OPT
    4 0.800790254 192.168.0.44 ? 199.7.83.42  DNS 82 Standard query 0x8244 NS <Root> OPT
    5 0.800810487 192.168.0.44 ? 199.7.83.42  DNS 86 Standard query 0xdb7b NS com OPT
    6 0.824449692  199.7.83.42 ? 192.168.0.44 DNS 1205 Standard query response 0xdb7b NS com NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
    7 0.825417060 192.168.0.44 ? 198.41.0.4   DNS 101 Standard query 0xae93 A b.gtld-servers.net OPT
    8 0.825510774 192.168.0.44 ? 198.41.0.4   DNS 101 Standard query 0xeda4 A c.gtld-servers.net OPT
    9 0.825546391 192.168.0.44 ? 198.41.0.4   DNS 101 Standard query 0x39e2 A a.gtld-servers.net OPT
   10 0.825619797 192.168.0.44 ? 198.41.0.4   DNS 101 Standard query 0x6086 A d.gtld-servers.net OPT
   11 0.825640888 192.168.0.44 ? 198.41.0.4   DNS 101 Standard query 0xf70a A e.gtld-servers.net OPT
   12 0.827193872  199.7.83.42 ? 192.168.0.44 DNS 1259 Standard query response 0x8244 NS <Root> NS a.root-servers.net NS b.root-servers.net NS c.root-servers.net NS d.root-servers.net NS e.root-servers.net NS f.root-servers.net NS g.root-servers.net NS h.root-servers.net NS i.root-servers.net NS j.root-servers.net NS k.root-servers.net NS l.root-servers.net NS m.root-servers.net RRSIG A 198.41.0.4 AAAA 2001:503:ba3e::2:30 A 170.247.170.2 AAAA 2801:1b8:10::b A 192.33.4.12 AAAA 2001:500:2::c A 199.7.91.13 AAAA 2001:500:2d::d A 192.203.230.10 AAAA 2001:500:a8::e A 192.5.5.241 AAAA 2001:500:2f::f A 192.112.36.4 AAAA 2001:500:12::d0d A 198.97.190.53 AAAA 2001:500:1::53 A 192.36.148.17 AAAA 2001:7fe::53 A 192.58.128.30 AAAA 2001:503:c27::2:30 A 193.0.14.129 AAAA 2001:7fd::1 A 199.7.83.42 OPT
   13 0.865943966   198.41.0.4 ? 192.168.0.44 DNS 1202 Standard query response 0xeda4 A c.gtld-servers.net NS m.gtld-servers.net NS k.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS d.gtld-servers.net NS h.gtld-servers.net NS j.gtld-servers.net NS l.gtld-servers.net NS a.gtld-servers.net NS e.gtld-servers.net NS c.gtld-servers.net NS g.gtld-servers.net NS i.gtld-servers.net DS RRSIG A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.43.172.30 AAAA 2001:503:39c1::30 OPT
   14 0.865992300   198.41.0.4 ? 192.168.0.44 DNS 1202 Standard query response 0xae93 A b.gtld-servers.net NS m.gtld-servers.net NS k.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS d.gtld-servers.net NS h.gtld-servers.net NS j.gtld-servers.net NS l.gtld-servers.net NS a.gtld-servers.net NS e.gtld-servers.net NS c.gtld-servers.net NS g.gtld-servers.net NS i.gtld-servers.net DS RRSIG A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.43.172.30 AAAA 2001:503:39c1::30 OPT
   15 0.867190148 192.168.0.44 ? 192.42.93.30 DNS 101 Standard query 0x15ac A c.gtld-servers.net OPT
   16 0.867208333 192.168.0.44 ? 192.42.93.30 DNS 101 Standard query 0xc030 A b.gtld-servers.net OPT
   17 0.867725684   198.41.0.4 ? 192.168.0.44 DNS 1202 Standard query response 0x6086 A d.gtld-servers.net NS m.gtld-servers.net NS k.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS d.gtld-servers.net NS h.gtld-servers.net NS j.gtld-servers.net NS l.gtld-servers.net NS a.gtld-servers.net NS e.gtld-servers.net NS c.gtld-servers.net NS g.gtld-servers.net NS i.gtld-servers.net DS RRSIG A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.43.172.30 AAAA 2001:503:39c1::30 OPT
   18 0.867747738   198.41.0.4 ? 192.168.0.44 DNS 1202 Standard query response 0x39e2 A a.gtld-servers.net NS m.gtld-servers.net NS k.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS d.gtld-servers.net NS h.gtld-servers.net NS j.gtld-servers.net NS l.gtld-servers.net NS a.gtld-servers.net NS e.gtld-servers.net NS c.gtld-servers.net NS g.gtld-servers.net NS i.gtld-servers.net DS RRSIG A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.43.172.30 AAAA 2001:503:39c1::30 OPT
   19 0.867756502   198.41.0.4 ? 192.168.0.44 DNS 1202 Standard query response 0xf70a A e.gtld-servers.net NS m.gtld-servers.net NS k.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS d.gtld-servers.net NS h.gtld-servers.net NS j.gtld-servers.net NS l.gtld-servers.net NS a.gtld-servers.net NS e.gtld-servers.net NS c.gtld-servers.net NS g.gtld-servers.net NS i.gtld-servers.net DS RRSIG A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.43.172.30 AAAA 2001:503:39c1::30 OPT
   20 0.868197866 192.168.0.44 ? 192.42.93.30 DNS 101 Standard query 0xcc89 A a.gtld-servers.net OPT
   21 0.868659373 192.168.0.44 ? 192.42.93.30 DNS 101 Standard query 0xb37b A d.gtld-servers.net OPT
   22 0.868677245 192.168.0.44 ? 192.42.93.30 DNS 101 Standard query 0x68a3 A e.gtld-servers.net OPT
   23 0.889542379 192.42.93.30 ? 192.168.0.44 DNS 527 Standard query response 0xc030 A b.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   24 0.889567212 192.42.93.30 ? 192.168.0.44 DNS 527 Standard query response 0x15ac A c.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   25 0.890386241 192.168.0.44 ? 192.43.172.30 DNS 96 Standard query 0x6b22 A av2.nstld.com OPT
   26 0.890404890 192.168.0.44 ? 192.43.172.30 DNS 96 Standard query 0x698e A av1.nstld.com OPT
   27 0.890444980 192.168.0.44 ? 192.43.172.30 DNS 96 Standard query 0x6d99 A av3.nstld.com OPT
   28 0.890489744 192.168.0.44 ? 192.43.172.30 DNS 96 Standard query 0x5f97 A av4.nstld.com OPT
   29 0.893814350 192.42.93.30 ? 192.168.0.44 DNS 527 Standard query response 0xb37b A d.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   30 0.893826230 192.42.93.30 ? 192.168.0.44 DNS 527 Standard query response 0xcc89 A a.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   31 0.893829824 192.42.93.30 ? 192.168.0.44 DNS 527 Standard query response 0x68a3 A e.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   32 0.914955792 192.43.172.30 ? 192.168.0.44 DNS 685 Standard query response 0x5f97 A av4.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   33 0.915242220 192.168.0.44 ? 192.42.177.30 DNS 96 Standard query 0x57d0 A av4.nstld.com OPT
   34 0.918222772 192.43.172.30 ? 192.168.0.44 DNS 685 Standard query response 0x6b22 A av2.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   35 0.918229998 192.43.172.30 ? 192.168.0.44 DNS 685 Standard query response 0x6d99 A av3.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   36 0.918233814 192.43.172.30 ? 192.168.0.44 DNS 685 Standard query response 0x698e A av1.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   37 0.918345397 192.168.0.44 ? 192.42.177.30 DNS 96 Standard query 0x9b11 A av2.nstld.com OPT
   38 0.918405861 192.168.0.44 ? 192.42.177.30 DNS 96 Standard query 0xf0ab A av1.nstld.com OPT
   39 0.918409195 192.168.0.44 ? 192.42.177.30 DNS 96 Standard query 0x490c A av3.nstld.com OPT
   40 0.967465414 192.42.177.30 ? 192.168.0.44 DNS 328 Standard query response 0x57d0 A av4.nstld.com A 192.82.134.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   41 0.967703389 192.168.0.44 ? 192.42.178.30 DNS 101 Standard query 0x885b A a.gtld-servers.net OPT
   42 0.967714312 192.168.0.44 ? 192.42.178.30 DNS 101 Standard query 0x7c18 A d.gtld-servers.net OPT
   43 0.967717383 192.168.0.44 ? 192.42.178.30 DNS 101 Standard query 0x9cae A b.gtld-servers.net OPT
   44 0.967719156 192.168.0.44 ? 192.42.178.30 DNS 101 Standard query 0x7b5f A c.gtld-servers.net OPT
   45 0.967723898 192.168.0.44 ? 192.42.178.30 DNS 101 Standard query 0x4904 A e.gtld-servers.net OPT
   46 0.971663860 192.42.177.30 ? 192.168.0.44 DNS 328 Standard query response 0xf0ab A av1.nstld.com A 192.42.177.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 AAAA 2001:500:124::30 OPT
   47 0.972314346 192.42.177.30 ? 192.168.0.44 DNS 328 Standard query response 0x9b11 A av2.nstld.com A 192.42.178.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   48 0.973540315 192.42.177.30 ? 192.168.0.44 DNS 328 Standard query response 0x490c A av3.nstld.com A 192.82.133.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   49 0.988231888 192.42.178.30 ? 192.168.0.44 DNS 186 Standard query response 0x7c18 A d.gtld-servers.net A 192.31.80.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   50 0.988244498 192.42.178.30 ? 192.168.0.44 DNS 186 Standard query response 0x4904 A e.gtld-servers.net A 192.12.94.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   51 0.988438879 192.168.0.44 ? 192.48.79.30 DNS 93 Standard query 0x34eb NS google.com OPT
   52 0.988522685 192.42.178.30 ? 192.168.0.44 DNS 186 Standard query response 0x885b A a.gtld-servers.net A 192.5.6.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   53 0.989055366 192.42.178.30 ? 192.168.0.44 DNS 186 Standard query response 0x7b5f A c.gtld-servers.net A 192.26.92.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   54 0.990052030 192.42.178.30 ? 192.168.0.44 DNS 186 Standard query response 0x9cae A b.gtld-servers.net A 192.33.14.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   56 1.026319721 192.48.79.30 ? 192.168.0.44 DNS 686 Standard query response 0x34eb NS google.com NS ns2.google.com NS ns1.google.com NS ns3.google.com NS ns4.google.com NSEC3 RRSIG NSEC3 RRSIG AAAA 2001:4860:4802:34::a A 216.239.34.10 AAAA 2001:4860:4802:32::a A 216.239.32.10 AAAA 2001:4860:4802:36::a A 216.239.36.10 AAAA 2001:4860:4802:38::a A 216.239.38.10 OPT
   57 1.026866509 192.168.0.44 ? 216.239.38.10 DNS 97 Standard query 0x8823 A ads.google.com OPT
   58 1.070370150 216.239.38.10 ? 192.168.0.44 DNS 101 Standard query response 0x8823 A ads.google.com A 142.251.41.78 OPT
   55 1.070840609 192.168.0.44 ? 192.168.0.44 DNS 129 Standard query response 0x8fbf A ads.google.com A 142.251.41.78 OPT
```

### Forward First Valid

```shell
podman run --rm -d --env CONF="$(cat named-forward-first-valid.conf)" --publish 8053:53/udp --cap-add NET_RAW --cap-add NET_ADMIN --name dns-test dns-test
podman exec -it dns-test tshark -i lo -i wlan0 -f "port 53"
```

```shell
dig @127.0.0.1 -p 8053 ads.google.com
podman stop dns-test
```

```shell
Capturing on 'Loopback: lo' and 'wlan0'
    1 0.000000000 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x4930 A ads.google.com OPT
    3 0.000465284 192.168.0.44 ? 199.7.83.42  DNS 82 Standard query 0xcbfd NS <Root> OPT
    4 0.000499835 192.168.0.44 ? 192.168.0.25 DNS 97 Standard query 0x7a2b A ads.google.com OPT
    5 0.006342940 192.168.0.25 ? 192.168.0.44 DNS 114 Standard query response 0x7a2b A ads.google.com A 0.0.0.0 OPT
    2 0.006568219 192.168.0.44 ? 192.168.0.44 DNS 129 Standard query response 0x4930 A ads.google.com A 0.0.0.0 OPT
    6 0.026268520  199.7.83.42 ? 192.168.0.44 DNS 1259 Standard query response 0xcbfd NS <Root> NS a.root-servers.net NS b.root-servers.net NS c.root-servers.net NS d.root-servers.net NS e.root-servers.net NS f.root-servers.net NS g.root-servers.net NS h.root-servers.net NS i.root-servers.net NS j.root-servers.net NS k.root-servers.net NS l.root-servers.net NS m.root-servers.net RRSIG A 198.41.0.4 AAAA 2001:503:ba3e::2:30 A 170.247.170.2 AAAA 2801:1b8:10::b A 192.33.4.12 AAAA 2001:500:2::c A 199.7.91.13 AAAA 2001:500:2d::d A 192.203.230.10 AAAA 2001:500:a8::e A 192.5.5.241 AAAA 2001:500:2f::f A 192.112.36.4 AAAA 2001:500:12::d0d A 198.97.190.53 AAAA 2001:500:1::53 A 192.36.148.17 AAAA 2001:7fe::53 A 192.58.128.30 AAAA 2001:503:c27::2:30 A 193.0.14.129 AAAA 2001:7fd::1 A 199.7.83.42 OPT
```

### Forward Only Valid

```shell
podman run --rm -d --env CONF="$(cat named-forward-only-valid.conf)" --publish 8053:53/udp --cap-add NET_RAW --cap-add NET_ADMIN --name dns-test dns-test
podman exec -it dns-test tshark -i lo -i wlan0 -f "port 53"
```

```shell
Capturing on 'Loopback: lo' and 'wlan0'
    1 0.000000000 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x6397 A ads.google.com OPT
    3 0.000523177 192.168.0.44 ? 192.168.0.26 DNS 97 Standard query 0x562e A ads.google.com OPT
    4 0.009533616 192.168.0.26 ? 192.168.0.44 DNS 114 Standard query response 0x562e A ads.google.com A 0.0.0.0 OPT
    2 0.009820767 192.168.0.44 ? 192.168.0.44 DNS 129 Standard query response 0x6397 A ads.google.com A 0.0.0.0 OPT
```

### Forward First Invalid

```shell
podman run --rm -d --env CONF="$(cat named-forward-first-invalid.conf)" --publish 8053:53/udp --cap-add NET_RAW --cap-add NET_ADMIN --name dns-test dns-test
podman exec -it dns-test tshark -i lo -i wlan0 -f "port 53"
```

```shell
dig @127.0.0.1 -p 8053 ads.google.com
podman stop dns-test
```

```shell
Capturing on 'Loopback: lo' and 'wlan0'
    1 0.000000000 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x4a47 A ads.google.com OPT
    2 0.000334320 192.168.0.44 ? 192.168.66.25 DNS 97 Standard query 0xf917 A ads.google.com OPT
    3 0.000339251 192.168.0.44 ? 198.41.0.4   DNS 82 Standard query 0x2383 NS <Root> OPT
    4 0.041888476   198.41.0.4 ? 192.168.0.44 DNS 1139 Standard query response 0x2383 NS <Root> NS l.root-servers.net NS j.root-servers.net NS f.root-servers.net NS h.root-servers.net NS d.root-servers.net NS b.root-servers.net NS k.root-servers.net NS i.root-servers.net NS m.root-servers.net NS e.root-servers.net NS g.root-servers.net NS c.root-servers.net NS a.root-servers.net RRSIG A 199.7.83.42 AAAA 2001:500:9f::42 A 192.58.128.30 AAAA 2001:503:c27::2:30 A 192.5.5.241 AAAA 2001:500:2f::f A 198.97.190.53 AAAA 2001:500:1::53 A 199.7.91.13 AAAA 2001:500:2d::d A 170.247.170.2 AAAA 2801:1b8:10::b A 193.0.14.129 AAAA 2001:7fd::1 A 192.36.148.17 AAAA 2001:7fe::53 A 202.12.27.33 AAAA 2001:dc3::35 A 192.203.230.10 AAAA 2001:500:a8::e A 192.112.36.4 AAAA 2001:500:12::d0d A 192.33.4.12 AAAA 2001:500:2::c A 198.41.0.4 AAAA 2001:503:ba3e::2:30 OPT
    5 1.201805716 192.168.0.44 ? 192.168.66.26 DNS 97 Standard query 0xc8d8 A ads.google.com OPT
    6 2.403470184 192.168.0.44 ? 198.41.0.4   DNS 97 Standard query 0xdfa1 A ads.google.com OPT
    7 2.442288425   198.41.0.4 ? 192.168.0.44 DNS 1216 Standard query response 0xdfa1 A ads.google.com NS l.gtld-servers.net NS j.gtld-servers.net NS h.gtld-servers.net NS d.gtld-servers.net NS b.gtld-servers.net NS f.gtld-servers.net NS k.gtld-servers.net NS m.gtld-servers.net NS i.gtld-servers.net NS g.gtld-servers.net NS a.gtld-servers.net NS c.gtld-servers.net NS e.gtld-servers.net DS RRSIG A 192.41.162.30 AAAA 2001:500:d937::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 OPT
    8 2.443305046 192.168.0.44 ? 192.168.66.26 DNS 101 Standard query 0xc666 A c.gtld-servers.net OPT
    9 2.443315174 192.168.0.44 ? 192.168.66.26 DNS 101 Standard query 0x3b04 A b.gtld-servers.net OPT
   10 2.443317310 192.168.0.44 ? 192.168.66.26 DNS 101 Standard query 0xe804 A a.gtld-servers.net OPT
   11 2.443430606 192.168.0.44 ? 192.168.66.26 DNS 101 Standard query 0xe4ca A d.gtld-servers.net OPT
   12 2.443472475 192.168.0.44 ? 192.168.66.26 DNS 101 Standard query 0x0fbb A e.gtld-servers.net OPT
   13 3.645153743 192.168.0.44 ? 192.168.66.25 DNS 101 Standard query 0x3095 A a.gtld-servers.net OPT
   14 3.645177802 192.168.0.44 ? 192.168.66.25 DNS 101 Standard query 0xda37 A d.gtld-servers.net OPT
   15 3.645181577 192.168.0.44 ? 192.168.66.25 DNS 101 Standard query 0x312e A c.gtld-servers.net OPT
   16 3.645389956 192.168.0.44 ? 192.168.66.25 DNS 101 Standard query 0x4210 A b.gtld-servers.net OPT
   17 3.645415503 192.168.0.44 ? 192.168.66.25 DNS 101 Standard query 0xcffb A e.gtld-servers.net OPT
   18 4.845804745 192.168.0.44 ? 192.5.5.241  DNS 101 Standard query 0xa44d A c.gtld-servers.net OPT
   19 4.845826774 192.168.0.44 ? 192.5.5.241  DNS 101 Standard query 0xf73a A a.gtld-servers.net OPT
   20 4.845851021 192.168.0.44 ? 192.5.5.241  DNS 101 Standard query 0x6190 A d.gtld-servers.net OPT
   21 4.846785929 192.168.0.44 ? 192.5.5.241  DNS 101 Standard query 0xf230 A b.gtld-servers.net OPT
   22 4.846808858 192.168.0.44 ? 192.5.5.241  DNS 101 Standard query 0x5ba6 A e.gtld-servers.net OPT
   23 4.871436284  192.5.5.241 ? 192.168.0.44 DNS 1202 Standard query response 0x5ba6 A e.gtld-servers.net NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
   24 4.871459853  192.5.5.241 ? 192.168.0.44 DNS 1202 Standard query response 0xa44d A c.gtld-servers.net NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
   25 4.871468797  192.5.5.241 ? 192.168.0.44 DNS 1202 Standard query response 0xf230 A b.gtld-servers.net NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
   26 4.871476441  192.5.5.241 ? 192.168.0.44 DNS 1202 Standard query response 0x6190 A d.gtld-servers.net NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
   27 4.871484846  192.5.5.241 ? 192.168.0.44 DNS 1202 Standard query response 0xf73a A a.gtld-servers.net NS a.gtld-servers.net NS b.gtld-servers.net NS c.gtld-servers.net NS d.gtld-servers.net NS e.gtld-servers.net NS f.gtld-servers.net NS g.gtld-servers.net NS h.gtld-servers.net NS i.gtld-servers.net NS j.gtld-servers.net NS k.gtld-servers.net NS l.gtld-servers.net NS m.gtld-servers.net DS RRSIG A 192.5.6.30 AAAA 2001:503:a83e::2:30 A 192.33.14.30 AAAA 2001:503:231d::2:30 A 192.26.92.30 AAAA 2001:503:83eb::30 A 192.31.80.30 AAAA 2001:500:856e::30 A 192.12.94.30 AAAA 2001:502:1ca1::30 A 192.35.51.30 AAAA 2001:503:d414::30 A 192.42.93.30 AAAA 2001:503:eea3::30 A 192.54.112.30 AAAA 2001:502:8cc::30 A 192.43.172.30 AAAA 2001:503:39c1::30 A 192.48.79.30 AAAA 2001:502:7094::30 A 192.52.178.30 AAAA 2001:503:d2d::30 A 192.41.162.30 AAAA 2001:500:d937::30 A 192.55.83.30 AAAA 2001:501:b1f9::30 OPT
   28 4.872525265 192.168.0.44 ? 192.33.14.30 DNS 101 Standard query 0x2d44 A c.gtld-servers.net OPT
   29 4.872677814 192.168.0.44 ? 192.33.14.30 DNS 101 Standard query 0xd1c3 A d.gtld-servers.net OPT
   30 4.872693586 192.168.0.44 ? 192.33.14.30 DNS 101 Standard query 0xf933 A a.gtld-servers.net OPT
   31 4.872835823 192.168.0.44 ? 192.33.14.30 DNS 101 Standard query 0x0a73 A e.gtld-servers.net OPT
   32 4.872854834 192.168.0.44 ? 192.33.14.30 DNS 101 Standard query 0x2d46 A b.gtld-servers.net OPT
   33 4.911006003 192.33.14.30 ? 192.168.0.44 DNS 527 Standard query response 0xd1c3 A d.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   34 4.911029633 192.33.14.30 ? 192.168.0.44 DNS 527 Standard query response 0x2d44 A c.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   35 4.911037918 192.33.14.30 ? 192.168.0.44 DNS 527 Standard query response 0xf933 A a.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   36 4.911062117 192.33.14.30 ? 192.168.0.44 DNS 527 Standard query response 0x0a73 A e.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   37 4.911779810 192.168.0.44 ? 192.168.66.26 DNS 96 Standard query 0xd822 A av2.nstld.com OPT
   38 4.911789558 192.168.0.44 ? 192.168.66.26 DNS 96 Standard query 0x1147 A av3.nstld.com OPT
   39 4.911792891 192.168.0.44 ? 192.168.66.26 DNS 96 Standard query 0xeb8e A av1.nstld.com OPT
   40 4.911853354 192.168.0.44 ? 192.168.66.26 DNS 96 Standard query 0x53de A av4.nstld.com OPT
   41 4.914888473 192.33.14.30 ? 192.168.0.44 DNS 527 Standard query response 0x2d46 A b.gtld-servers.net NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG OPT
   42 5.005295405 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x4a47 A ads.google.com OPT
   43 6.112779909 192.168.0.44 ? 192.168.66.25 DNS 96 Standard query 0x7b3b A av3.nstld.com OPT
   44 6.112795785 192.168.0.44 ? 192.168.66.25 DNS 96 Standard query 0x18fc A av2.nstld.com OPT
   45 6.113133826 192.168.0.44 ? 192.168.66.25 DNS 96 Standard query 0x0b53 A av1.nstld.com OPT
   46 6.113254257 192.168.0.44 ? 192.168.66.25 DNS 96 Standard query 0x45ed A av4.nstld.com OPT
   47 7.313802250 192.168.0.44 ? 192.52.178.30 DNS 96 Standard query 0x9fc8 A av3.nstld.com OPT
   48 7.313851624 192.168.0.44 ? 192.52.178.30 DNS 96 Standard query 0x76dd A av2.nstld.com OPT
   49 7.313908871 192.168.0.44 ? 192.52.178.30 DNS 96 Standard query 0xace3 A av1.nstld.com OPT
   50 7.314559348 192.168.0.44 ? 192.52.178.30 DNS 96 Standard query 0x835c A av4.nstld.com OPT
   51 7.354691681 192.52.178.30 ? 192.168.0.44 DNS 685 Standard query response 0x835c A av4.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   52 7.354857341 192.52.178.30 ? 192.168.0.44 DNS 685 Standard query response 0xace3 A av1.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   53 7.355266706 192.168.0.44 ? 192.82.134.30 DNS 96 Standard query 0x37b4 A av1.nstld.com OPT
   54 7.355282238 192.168.0.44 ? 192.82.134.30 DNS 96 Standard query 0x8d5d A av4.nstld.com OPT
   55 7.355606284 192.52.178.30 ? 192.168.0.44 DNS 685 Standard query response 0x76dd A av2.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   56 7.355632093 192.52.178.30 ? 192.168.0.44 DNS 685 Standard query response 0x9fc8 A av3.nstld.com NS av1.nstld.com NS av2.nstld.com NS av3.nstld.com NS av4.nstld.com NSEC3 RRSIG NSEC3 RRSIG A 192.42.177.30 AAAA 2001:500:124::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.82.134.30 AAAA 2001:500:127::30 OPT
   57 7.356061456 192.168.0.44 ? 192.82.134.30 DNS 96 Standard query 0x8a28 A av3.nstld.com OPT
   58 7.356077461 192.168.0.44 ? 192.82.134.30 DNS 96 Standard query 0x3c02 A av2.nstld.com OPT
   59 7.377641504 192.82.134.30 ? 192.168.0.44 DNS 328 Standard query response 0x8d5d A av4.nstld.com A 192.82.134.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   60 7.377687532 192.82.134.30 ? 192.168.0.44 DNS 328 Standard query response 0x37b4 A av1.nstld.com A 192.42.177.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 AAAA 2001:500:124::30 OPT
   61 7.377696519 192.82.134.30 ? 192.168.0.44 DNS 328 Standard query response 0x8a28 A av3.nstld.com A 192.82.133.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 A 192.42.178.30 AAAA 2001:500:125::30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   62 7.378122246 192.168.0.44 ? 192.82.133.30 DNS 101 Standard query 0x15a2 A c.gtld-servers.net OPT
   63 7.378187697 192.168.0.44 ? 192.82.133.30 DNS 101 Standard query 0x1ae6 A d.gtld-servers.net OPT
   64 7.378206284 192.168.0.44 ? 192.82.133.30 DNS 101 Standard query 0xfe4e A a.gtld-servers.net OPT
   65 7.378228676 192.168.0.44 ? 192.82.133.30 DNS 101 Standard query 0x0aae A e.gtld-servers.net OPT
   66 7.378254692 192.168.0.44 ? 192.82.133.30 DNS 101 Standard query 0xc460 A b.gtld-servers.net OPT
   67 7.378533052 192.82.134.30 ? 192.168.0.44 DNS 328 Standard query response 0x3c02 A av2.nstld.com A 192.42.178.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com A 192.82.134.30 AAAA 2001:500:127::30 AAAA 2001:500:125::30 A 192.82.133.30 AAAA 2001:500:126::30 A 192.42.177.30 AAAA 2001:500:124::30 OPT
   68 7.414900147 192.82.133.30 ? 192.168.0.44 DNS 186 Standard query response 0x1ae6 A d.gtld-servers.net A 192.31.80.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   69 7.414940450 192.82.133.30 ? 192.168.0.44 DNS 186 Standard query response 0xfe4e A a.gtld-servers.net A 192.5.6.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   70 7.415104842 192.82.133.30 ? 192.168.0.44 DNS 186 Standard query response 0x0aae A e.gtld-servers.net A 192.12.94.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   71 7.415560611 192.168.0.44 ? 192.168.66.26 DNS 93 Standard query 0x36ca NS google.com OPT
   72 7.418345176 192.82.133.30 ? 192.168.0.44 DNS 186 Standard query response 0xc460 A b.gtld-servers.net A 192.33.14.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   73 7.418380600 192.82.133.30 ? 192.168.0.44 DNS 186 Standard query response 0x15a2 A c.gtld-servers.net A 192.26.92.30 NS av4.nstld.com NS av2.nstld.com NS av3.nstld.com NS av1.nstld.com OPT
   74 8.615791160 192.168.0.44 ? 192.168.66.25 DNS 93 Standard query 0xe075 NS google.com OPT
   75 9.817340787 192.168.0.44 ? 192.12.94.30 DNS 93 Standard query 0x919d NS google.com OPT
   76 10.010977100 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0x4a47 A ads.google.com OPT
   80 10.618547855 192.168.0.44 ? 192.31.80.30 DNS 93 Standard query 0x5020 NS google.com OPT
   81 10.673463332 192.31.80.30 ? 192.168.0.44 DNS 686 Standard query response 0x5020 NS google.com NS ns2.google.com NS ns1.google.com NS ns3.google.com NS ns4.google.com NSEC3 RRSIG NSEC3 RRSIG AAAA 2001:4860:4802:34::a A 216.239.34.10 AAAA 2001:4860:4802:32::a A 216.239.32.10 AAAA 2001:4860:4802:36::a A 216.239.36.10 AAAA 2001:4860:4802:38::a A 216.239.38.10 OPT
   77 10.674170306 192.168.0.44 ? 192.168.0.44 DNS 113 Standard query response 0x4a47 Server failure A ads.google.com OPT
   78 10.674399090 192.168.0.44 ? 192.168.0.44 DNS 113 Standard query response 0x4a47 Server failure A ads.google.com OPT
   79 10.674461474 192.168.0.44 ? 192.168.0.44 DNS 113 Standard query response 0x4a47 Server failure A ads.google.com OPT
```

### Forward Only Invalid

```shell
podman run --rm -d --env CONF="$(cat named-forward-only-invalid.conf)" --publish 8053:53/udp --cap-add NET_RAW --cap-add NET_ADMIN --name dns-test dns-test
podman exec -it dns-test tshark -i lo -i wlan0 -f "port 53"
```

```shell
dig @127.0.0.1 -p 8053 ads.google.com
podman stop dns-test
```

```shell
Capturing on 'Loopback: lo' and 'wlan0'
    1 0.000000000 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0xf7e5 A ads.google.com OPT
    2 0.000358479 192.168.0.44 ? 192.168.66.25 DNS 97 Standard query 0xb83f A ads.google.com OPT
    3 1.200520540 192.168.0.44 ? 192.168.66.26 DNS 97 Standard query 0x584f A ads.google.com OPT
    4 2.401684779 192.168.0.44 ? 192.168.66.26 DNS 97 Standard query 0x9694 A ads.google.com OPT
    5 3.603201523 192.168.0.44 ? 192.168.66.25 DNS 97 Standard query 0xa959 A ads.google.com OPT
    6 4.804635102 192.168.0.44 ? 192.168.66.26 DNS 97 Standard query 0x941e A ads.google.com OPT
    7 5.004738703 192.168.0.44 ? 192.168.0.44 DNS 97 Standard query 0xf7e5 A ads.google.com OPT
    8 6.006152258 192.168.0.44 ? 192.168.66.25 DNS 97 Standard query 0x1181 A ads.google.com OPT
    9 7.207670210 192.168.0.44 ? 192.168.66.26 DNS 97 Standard query 0x5fe4 A ads.google.com OPT
   10 8.809663249 192.168.0.44 ? 192.168.66.25 DNS 97 Standard query 0xcb77 A ads.google.com OPT
   11 10.000588065 192.168.0.44 ? 192.168.0.44 DNS 113 Standard query response 0xf7e5 Server failure A ads.google.com OPT
   12 10.000601148 192.168.0.44 ? 192.168.0.44 DNS 113 Standard query response 0xf7e5 Server failure A ads.google.com OPT
```
