
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