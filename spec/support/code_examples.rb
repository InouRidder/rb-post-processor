# frozen_string_literal: true

module CodeExamples
  def self.syntax_error
    'def my_method'
  end
  EXAMPLES = [
    {
      input:
'class MultilineParams
def foo(
a: 1
)
a
end
end',
      output: "class MultilineParams\n  def foo(\n          a: 1)\n    a\n  end\nend\n"
    },
    {
      input: 'def HELLO;x=1;end',
      output: "def HELLO; x = 1; end\n"
    }
  ]
end
