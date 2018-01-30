
## Mirroring OFF

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    19.45ms  109.06ms   1.08s    97.20%
    Req/Sec     2.23k   694.70     4.28k    67.41%
  129287 requests in 30.08s, 104.80MB read
Requests/sec:   4298.41
Transfer/sec:      3.48MB
```

## Mirroring ON

```
server backend fail_timeout=0;
```

### Backend UP

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    25.52ms  110.46ms   1.07s    97.07%
    Req/Sec   642.04    148.78     1.07k    69.31%
  37287 requests in 30.10s, 30.22MB read
Requests/sec:   1238.78
Transfer/sec:      1.00MB
```

### Backend DOWN

```
server backend:8080 fail_timeout=0;
```

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    47.90ms  162.97ms   1.06s    93.19%
    Req/Sec     0.98k   287.89     1.94k    66.18%
  53597 requests in 30.03s, 43.44MB read
Requests/sec:   1785.00
Transfer/sec:      1.45MB
```

```
server backend:8080 fail_timeout=10;
```

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    87.04ms  220.04ms   1.07s    88.64%
    Req/Sec     1.01k   364.48     1.76k    70.93%
  50471 requests in 30.10s, 40.91MB read
Requests/sec:   1676.95
Transfer/sec:      1.36MB
```

### Backend NO CONNECTION

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     6.07ms  410.52us   6.66ms   60.00%
    Req/Sec    12.00      0.00    12.00    100.00%
  10 requests in 30.10s, 8.30KB read
  Socket errors: connect 0, read 10, write 0, timeout 0
Requests/sec:      0.33
Transfer/sec:     282.35B
```

```
proxy_buffering off;	
proxy_connect_timeout 1s;
```

```
Running 30s test @ http://localhost:8081/
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    69.82ms  200.23ms   1.02s    90.11%
    Req/Sec     1.91k   748.68     4.03k    72.23%
  98882 requests in 30.06s, 80.15MB read
  Socket errors: connect 0, read 25, write 0, timeout 4
Requests/sec:   3290.02
Transfer/sec:      2.67MB
```