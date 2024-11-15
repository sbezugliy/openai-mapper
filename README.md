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

### Simple chat-completion

```Ruby
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

It returns `Openai::Mapper::Chat::Completions` object.

JSON answer object example:
```JSON
{
  "id": "chatcmpl-8EwrQEw3dxpnPxalQhjoqljGS46NW",
  "object": "chat.completion",
  "created": 1698573544,
  "model": "gpt-3.5-turbo-0613",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Hello there! How can"
      },
      "finish_reason": "length"
    }
  ],
  "usage": {
    "prompt_tokens": 33,
    "completion_tokens": 5,
    "total_tokens": 38
  }
}
```

### Image generation

#### Image by text question
Image may be generated as an `base64` binary and image file.

```Ruby
question = "technowizard"

dalle = Openai::Images::Create.new
dalle.request(
  prompt: question,
  n: 1,
  size: "1024x1024",
  user: "s.bezugliy@codenv.top",
  response_format: "b64_json"
)

dalle.data.data.each.with_index do |image, index|
  f = File.new(File.join(__dir__, "../output/#{dalle.data.created}-#{index}.png"), "w")
  f.write(Base64.decode64(image.b64_json))
  f.close
end
```

#### Edit Image with text instructions

```Ruby
question = "Replace heads with a teapot"

dalle = Openai::Images::Edit.new
dalle.request(
  image: "origin1.png",
  prompt: question,
  n: 10,
  size: "1024x1024",
  response_format: "b64_json",
  user: "s.bezugliy@codenv.top"
)

dalle.data.data.each.with_index do |image, index|
  f = File.new(File.join(__dir__, "../output/edits/#{dalle.data.created}-#{index}.png"), "w")
  f.write(Base64.decode64(image.b64_json))
  f.close
end
```

#### Image variations by origin image

Pass original image

```Ruby
dalle = Openai::Images::Variations.new
dalle.request(
  image: "origin1.png",
  n: 10,
  size: "1024x1024",
  response_format: "b64_json",
  user: "s.bezugliy@codenv.top"
)

dalle.data.data.each.with_index do |image, index|
  f = File.new(File.join(__dir__, "../output/variations/#{dalle.data.created}-#{index}.png"), "w")
  f.write(Base64.decode64(image.b64_json))
  f.close
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sbezugliy/openai-mapper. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/sbezugliy/openai-mapper/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the Openai::Mapper project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sbezugliy/openai-mapper/blob/main/CODE_OF_CONDUCT.md).
