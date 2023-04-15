# Static Web Servers Benchmarks

> A benchmark suite which measures the requests per second and latency on average for several web servers.

<img title="SWS - Benchmarks 2022" src="benchmarks.png" width="860">

## Motivation and context

We wanted to prepare some benchmarks to have a general idea about the SWS performance path over time as well as an excuse to improve/optimize SWS in that regard.

## Important Remarks

- Note that this is a rough reference about some particular performance aspects (requests per second and latency on average) so take it *at your own risk*.
- Be also aware that **_this benchmark disables in-memory cache_** for some servers intentionally since SWS doesn't provide such a feature yet.<br>
In the case of some web servers providing that by default then it gets disabled explicitly. See for example [*binserve's author comment*](https://github.com/static-web-server/static-web-server/issues/156#issuecomment-1293941692) in this context.
- Have also in mind that some web servers follow approaches like [Nignx's hybrid disk‑and‑memory cache strategy](https://www.nginx.com/blog/cache-placement-strategies-nginx-plus#Where-is-Cached-Data-Stored) which could work in its favor.

## Benchmarks history

- [2023-16](./data/2023-16)
- [2022-10](./data/2022-10)

## Perform the benchmarks

Change `URL` env with the corresponding server URL to load test and generate the [wrk](https://github.com/wg/wrk) metrics.

```sh
# NOTE: the load test is per server
SERVER="sws" URL="http://localhost" make wrk
# wrk -c 500 -t 12 -d 10s --latency http://localhost
```

After that, `wrk` will save two files (JSON/CSV) on disk with the resulting metrics. 

For more details about settings see [Makefile](./Makefile)

## System used

- **OS:** Arch Linux
- **Kernel:** 5.19.13-arch1-1 (64 bits)
- **Processor:** 4 × Intel® Core™ i7-6500U
- **RAM:** 8 GiB

## Contributions

Of course, if you find any issue or remark/improvement to do please don't hesitate to file an [issue](https://github.com/static-web-server/static-web-server/issues) or send a [Pull request](https://github.com/static-web-server/static-web-server/pulls).
