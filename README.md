## Summary:

On launch, NSURLRequest does not use data stored in the cache and -[NSURLCache cachedResponseForRequest:] does not return a result. However, after the cache is used, both will start working until the app is restarted.

## Steps to Reproduce:

Example project for iOS: https://github.com/davbeck/CacheExample

### A failed cache loading

1. Launch app
2. Tap "Load From Server" and observe a successfully loaded image
3. Relaunch the app
4. Tap "Load From Cache" and observe an unsuccessful load

At this point, you can tap "Clear Cache" and relaunch to reset.

### A successful cache loading

1. Launch app
2. Tap "Load From Server" and observe a successfully loaded image
3. Relaunch the app
4. Tap "Test Cache"
5. Tap "Load From Cache" and observe a successful load from cache

## Expected Results:

The cache should work on first launch without directly accessing the NSURLCache.

## Actual Results:

The cache does not return a result until it has been "touched".

## Notes:

"Load From Server" will always load from the server even if the cache would return a result. Conversely, "Load From Cache" never loads from the server and only loads from the cache.

While `-[NSURLCache currentDiskUsage]` will cause the cache to work correctly, `-[NSURLCache diskCapacity]`, `-[NSURLCache currentMemoryUsage]`, `-[NSURLCache memoryCapacity]` as well as loading the request from the server (which causes the result to be cached automatically) will have the same effect. Other actions might work similarly.

[rdar://12712196](rdar://12712196)