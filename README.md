# Openai::Mapper

OpenAI client and question/answer mapper.

Most of API requests are covered, others in progress...

## Installation

Add to the Gemfile

```
gem "openai-mapper"
```

## Usage

Set environment variables:
- `OPENAI_TOKEN` OpenAI secret token
- `OPENAI_ORGANIZATION` (Optional) OpenAI organization token

Simple use-case for chat-completion
```ruby
question = {
  model: "gpt-3.5-turbo",
  messages: [
    ::Openai::Mapper::Message.new(
      role: "system",
      content: "Hello from openai-mapper: https://github.com/sbezugliy/openai-mapper"
    ),
    ::Openai::Mapper::Message.new(
      role: "user",
      content: "Hello!"
    )
  ]
}

chat_completion = Openai::Chat::Completions.new
answer = chat_completion.request(question)



```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sbezugliy/openai-mapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sbezugliy/openai-mapper/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Openai::Mapper project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sbezugliy/openai-mapper/blob/main/CODE_OF_CONDUCT.md).
