# frozen_string_literal: true

module Translation
  module Infrastructure
    module Format
      class Markdown
        def format(source:, target:)
          <<"EOS"
#{target}

<details>
  <summary>原文</summary>

#{(source.split("\n").map { |s| "> #{s}" }).join("\n")}
</details>

EOS
        end
      end
    end
  end
end

