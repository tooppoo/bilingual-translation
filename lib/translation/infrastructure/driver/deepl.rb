# frozen_string_literal: true

require 'translation/model/target_text'

module Translation
  module Infrastructure
    module Driver
      # :section: deepl apiを使って対訳に変換する
      # :see_also: https://www.deepl.com/docs-api/translating-text/request/
      class DeepL
        require 'net/http'
        require 'uri'
        require 'json'

        def initialize(auth_key:)
          @auth_key = auth_key
        end

        def translate(source, from:, to:)
          # @type [Hash[]] texts
          # @example
          # [
          #   ["text", "Hello."],
          #   ["text", "I am John Doe."],
          #   ["text", "Who are you?"],
          # ]
          texts = source.sentences.map { |s| ["text", s.to_s] }
          source_lang = ["source_lang", from.to_s]
          target_lang = ["target_lang", to.to_s]
          auth_key = ["auth_key", @auth_key]

          response = post("https://api-free.deepl.com/v2/translate", [
            *texts,
            source_lang,
            target_lang,
            auth_key,
          ])
          body = response.body
          data = JSON.parse body, symbolize_names: true

          sections = data[:translations].map.with_index do |target, i|
            src = source.sentences[i]

            ::Translation::Model::TargetText::Section.new(source: src, target: target[:text])
          end

          ::Translation::Model::TargetText.new(sections: sections)
        end

        private def post(url, param)
          uri = URI.parse url
          # 重複キーをパラメータに指定する必要があるので、別途エンコード
          req = Net::HTTP::Post.new(uri.path).tap do |r|
            r.body = URI.encode_www_form param
            r.content_type = 'application/x-www-form-urlencoded'
          end

          client = Net::HTTP.new(uri.host, uri.port).tap do |http|
            http.use_ssl = true
          end

          client.start do |http|
            http.request(req)
          end
        end
      end
    end
  end
end
