# async-flask-demo

Just a demo to show how to make Flask work with evented I/O, and compare it with the FastAPI+Uvicorn stack.

## Preparing your environment

Make sure you have "just" installed (it's a better "make").

Also, make sure you have Poetry installed:

```shell
$ pip install poetry
```

## Running

To run the FastAPI stack:

```shell
$ just run-asyncio
```

To run the Flask stack:

```shell
$ just run-flask
```

## Async Flask? Really?

Check for yourself: run this command in two different terminals:

```shell
$ time curl http://localhost:8001/sleep/10.0
```

You'll see that it does take roughly 10 seconds for each response, but with a single process. (With uWSGI this can be increased to more worker processes if need be, although the gevent thread count is quite high already.)

## Performance

If you're curious about how they compare to each other in a very simple scenario where they need to do some non-blocking work, you can test the `/sleep/<some-float>` endpoint with something like Apache Bench. For example:

```shell
$ ab -c 1000 -n 2000 http://localhost:8001/sleep/1.0
```
