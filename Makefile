SWS ?= $(shell static-web-server --version)
TODAY ?= $(shell date -u '+%B %Y')

# Load testing benchmark settings
# which can be passed via envs per web server testing
SERVER ?= "sws"
URL ?= "http://localhost:8787"
THREADS ?= 4
CONNECTIONS ?= 100
DURATION ?= 1m

wrk:
	@env SERVER=$(SERVER) \
		wrk -c $(CONNECTIONS) -t $(THREADS) -d $(DURATION) \
			--latency -s benchmark_collector.lua $(URL)
.PHONY: wrk

# TODO:
vegeta:
	@echo $(SWS)
	@vegeta --version
	@echo "GET $(URL)" | \
		vegeta -cpus=12 attack -workers=4 -connections=100 -rate=6500/s -duration=10s -http2=false > benchmark.bin
	@cat benchmark.bin | vegeta report -type='hist[0,2ms,4ms,6ms]'
	@cat benchmark.bin | vegeta plot --title "$(SWS) - $(TODAY)" > benchmark.html
.PHONY: vegeta
