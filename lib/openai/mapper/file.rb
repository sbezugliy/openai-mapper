module Openai
  module Mapper
    class File < ::Openai::Mapper::BaseMapper
    end
  end
end

# {
  # "id": "file-abc123",
  # "object": "file",
  # "bytes": 120000,
  # "created_at": 1677610602,
  # "filename": "my_file.jsonl",
  # "purpose": "fine-tune",
  # "status": "uploaded",
  # "status_details": null
# }
