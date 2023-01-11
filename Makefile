# TODO - templatize this 

images:
	docker build -t benchapp-3.8 --build-arg VERSION=3.8 .
	docker build -t benchapp-3.9 --build-arg VERSION=3.9 .
	docker build -t benchapp-3.10 --build-arg VERSION=3.10 .
	docker build -t benchapp-3.11 --build-arg VERSION=3.11 .

benchmarks-3.8:
	docker run -d -p 127.0.0.1:8000:80/tcp --name benchmark-server-3.8 benchapp-3.8
	python -m profiler results_3.8
	docker stop benchmark-server-3.8
	docker rm benchmark-server-3.8

benchmarks-3.9:
	docker run -d -p 127.0.0.1:8000:80/tcp --name benchmark-server-3.9 benchapp-3.9 
	python -m profiler results_3.9
	docker stop benchmark-server-3.9
	docker rm benchmark-server-3.9

benchmarks-3.10:
	docker run -d -p 127.0.0.1:8000:80/tcp --name benchmark-server-3.10 benchapp-3.10
	python -m profiler results_3.10
	docker stop benchmark-server-3.10
	docker rm benchmark-server-3.10

benchmarks-3.11:
	docker run -d -p 127.0.0.1:8000:80/tcp --name benchmark-server-3.11 benchapp-3.11
	python -m profiler results_3.11
	docker stop benchmark-server-3.11
	docker rm benchmark-server-3.11

benchmarks: benchmarks-3.8 benchmarks-3.9 benchmarks-3.10 benchmarks-3.11