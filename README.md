# Digest Client

## Development console

```
irb -I lib -r digest_client
```

## Run all tests

https://stackoverflow.com/a/20677149/2909897

```
ruby -I lib -e 'ARGV.each { |f| load f }' test/*_test.rb
```