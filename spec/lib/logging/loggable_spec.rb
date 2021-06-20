# frozen_string_literal: true

require "logging/loggable"

RSpec::Matchers.define :hash_with_keys do |*keys|
  match do |actual|
    keys.all? do |key|
      actual.has_key? key
    end
  end
end

describe Logging::Loggable do
  class Target
    def without_params
      3
    end

    def with_params(a, b)
      a + b
    end

    def with_keyword_params(a, b:)
      a + b
    end

    def with_optional_params(a, b = 2)
      a + b
    end

    def with_optional_keyword_params(a, b: 2)
      a + b
    end
  end

  let(:logger) do
    double("logger").tap do |stub|
      expect(stub).to receive("info").with(hash_with_keys(:parameters, :receiver))
      expect(stub).to receive("info").with(hash_with_keys(:return, :receiver))
    end
  end
  let(:decorator) do
    Logging::Loggable.info(logger: logger)
  end
  let(:target) do
    decorator.apply to: Target.new, watch: Target.instance_methods(false)
  end

  [
    { name: :without_params, f: ->(obj) { obj.without_params } },
    { name: :with_params, f: ->(obj) { obj.with_params(1, 2) } },
    { name: :with_keyword_params, f: ->(obj) { obj.with_keyword_params(1, b: 2) } },
    { name: :with_optional_params, f: ->(obj) { obj.with_optional_params(1) } },
    { name: :with_optional_keyword_params, f: ->(obj) { obj.with_optional_keyword_params(1) } },
  ].each do |test_case|
    context test_case[:name] do
      it "should use logger" do
        expect(test_case[:f].call(target)).to eq 3
      end
    end
  end
end
