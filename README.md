# Import

Welcome to the import script!

## Installation and usage

You can clone the repository and execute these commands from the root directory:

```bash
bunlde install
rake build
gem install --local ./pkg/*.gem
```

And then execute the script:

    $ import clientname path/to/client/file

You can also execute the script without installing the gem:

```bash
cd import
bundle install
exe/import capterra feed-products/capterra.json # or any other client and file.
```

## Development

#### New client

In case you need to add a new client, you can do it by adding a record into the clients dictionary at 'lib/import/dictionaries/clients_dictionary.rb'.
You need to provide:

* root path of the collection (provide nil if none)
* item path of the collection (provide nil if none)
* name key
* categories key
* twitter key
* splitter (just provide it in case a split is needed on the categories value. Defaults to nil).

#### New adapter

In case a new adapter is needed (currently, we have adapters for json, yaml, and we are coding the csv one), place it under the lib/import/adapters directory.
Each adapter should inherit from ApplicationProcessor and define the private method stream, which is the responsible of converting the data into a ruby structure.

Remember also to include the new adapter on the mimes hash at lib/import/dictionaries/mimes_dictionary.rb

#### Testing

To run the tests, please execute `rake test`. I am very used to minitest due to it's simplicity and versatility.

## NOTES

These are the things I would have done with more time:

1. Require just the needed adapters: Try if it worsts to return, from the mimes_dictionary hash, a string that could be converted into a class, and so require just this class and not all the adapters when bootstraping the script.
2. Add flags to the command line options: I think it would be really necessary to provide the flags -c clientname, -f filename. Using OptParser the help messages would be much clear and the instructions. This would have also clean the initial call to the Import::Import class. It will be also scalable by adding more options. One option could be the format (--format=json), this way it wont be necessary to get the format from the file extension.
3. Add API documentation to have a web docs api using rdoc.
4. Use gems that stream better json and yaml files, like json-stream or yajl. At the moment, the json library from ruby consumes the whole file before returning a ruby structure. The yaml library does the same, but at least if more than one yaml document is on the same file, it streams them one at a time.
6. Use a custom logger instead of $stdout


#### More on development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/import. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Import project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/import/blob/master/CODE_OF_CONDUCT.md).
