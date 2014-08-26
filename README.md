# Chef cookbook for graphite-api

[![Build Status](https://travis-ci.org/odolbeau/cookbook-graphite-api.png)](https://travis-ci.org/odolbeau/cookbook-graphite-api)

## Description

Chef cookbook for
[graphite-api](http://graphite-api.readthedocs.org/en/latest/),  an alternative
to Graphite-web.

## Requirements

* Debian
* Ubuntu

**Notes**: This cookbook has been tested on Debian 7.2 and Ubuntu 14.04. It may
work on other platforms with or without modification. Please [report
issues](https://github.com/odolbeau/cookbook-graphite-api/issues) any
additional platforms so they can be added.

## Usage

### graphite-api::default

Just include `graphite-api` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[graphite-api]"
  ]
}
```

## Tests

Install rubygems dependencies with `bundle install`.

Then you can check the cookbook style with `rake style`.

The default `rake` command also launch all kitchen tests. Take care, it can be
long.

## License

This cookbook is released under the MIT License. See the bundled LICENSE file
for details.
