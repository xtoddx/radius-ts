$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'radius'

if RUBY_PLATFORM == 'java'
  require 'java'
  require 'radius/parser/jscanner'
end

require 'benchmark'

document = <<EOF
Before it all
<r:foo>
  Middle Top
  <r:bar />
  Middle Bottom
</r:foo>
After it all
EOF

amount = 1000

Benchmark.bmbm do |bm|
  bm.report('vanilla') do
    scanner = Radius::Scanner.new(:scanner => Radius::Scanner)
    amount.times { scanner.operate('r', document) }
  end

  if RUBY_PLATFORM == 'java'
    bm.report('JavaScanner') do
      scanner = Radius::JavaScanner.new(JRuby.runtime)
      amount.times { scanner.operate('r', document) }
    end
  end
end
