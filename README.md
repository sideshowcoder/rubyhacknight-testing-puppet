# Running Beaker Rspec Example

Testing puppet modules using
[beaker-rspec](https://github.com/puppetlabs/beaker)

## Requirements

- vagrant
- ruby (tested on 2.1.5)

## Run

```shell
$ bundle install
$ bundle exec rspec spec/my_module_spec.rb
```

## What happens

This is a very basic example of using `beaker-rspec` to test puppet modules. In
this case we define a module which installs curl, and test if the install
succeeds.

1. Bootup the hosts defined in `spec/acceptance/nodesets/default.yml`
2. Run the `my_module_spec.rb`
  1. copy the module to the hosts via `puppet_module_install(source: module_root, module_name: 'my_module')` see `spec_helper_acceptance.rb`
  2. apply the module via `apply_manifest(pp, :catch_failures => true)` see
     `my_module_spec.rb`
  3. test if curl is installed by running it
