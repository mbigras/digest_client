# Digest Client

## Development console

```
irb -I lib -r digest_client
```

## Start the test web server

```
ruby test/test_server.rb
```

## Run all tests

https://stackoverflow.com/a/20677149/2909897

```
ruby -I lib -e 'ARGV.each { |f| load f }' test/*_test.rb
```