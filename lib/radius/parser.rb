module Radius
  #
  # The Radius parser. Initialize a parser with a Context object that
  # defines how tags should be expanded. See the QUICKSTART[link:files/QUICKSTART.html]
  # for a detailed explaination of its usage.
  #
  class Parser
    # The Context object used to expand template tags.
    attr_accessor :context
  
    # The string that prefixes all tags that are expanded by a parser
    # (the part in the tag name before the first colon).
    attr_accessor :tag_prefix
  
    # Creates a new parser object initialized with a Context.
    def initialize(context = Context.new, options = {})
      if context.kind_of?(Hash) and options.empty?
        options = context
        context = options[:context] || options['context'] || Context.new
      end
      options = Util.symbolize_keys(options)
      @context = context
      @tag_prefix = options[:tag_prefix]
    end

    # Parses string for tags, expands them, and returns the result.
    def parse(string)
      @stack = [ParseContainerTag.new { |t| t.contents.to_s }]
      pre_parse(string)
      @stack.last.to_s
    end

    protected

      def pre_parse(text) # :nodoc:
        s = Scanner.new(text)
        s.parse
        if s.flavor != :self && 
          start_tag = s.starttag
          attr = s.attrs
          @stack.last.contents << ParseTag.new { parse_individual(s.preparse) }
          remaining = s.leftover
          if s.flavor == :open
            parse_start_tag(start_tag, attr, remaining)
          else
            parse_end_tag(start_tag, remaining)
          end
        else
          if @stack.length == 1
            @stack.last.contents << ParseTag.new { parse_individual(s.preparse) }
          else
            raise MissingEndTagError.new(@stack.last.name)
          end
        end
      end

      def parse_start_tag(start_tag, attr, remaining) # :nodoc:
        @stack.push(ParseContainerTag.new(start_tag, parse_attributes(attr)))
        pre_parse(remaining)
      end

      def parse_end_tag(end_tag, remaining) # :nodoc:
        popped = @stack.pop
        if popped.name == end_tag
          popped.on_parse { |t| @context.render_tag(popped.name, popped.attributes) { t.contents.to_s } }
          tag = @stack.last
          tag.contents << popped
          pre_parse(remaining)
        else
          raise MissingEndTagError.new(popped.name)
        end
      end

      def parse_individual(text) # :nodoc:
        re = %r{
          <#{@tag_prefix}:([\w:]+?)\s*(
            (?:\w+\s*=\s*(?:"[^"]*?"|'[^']*?')\s*)*
          |)/>
        }x
        if md = re.match(text)
          attr = parse_attributes($2)
          replace = @context.render_tag($1, attr)
          md.pre_match + replace + parse_individual(md.post_match)
        else
          text || ''
        end
      end

      def parse_attributes(text) # :nodoc:
        attr = {}
        re = /(\w+?)\s*=\s*('|")(.*?)\2/
        while md = re.match(text)
          attr[$1] = $3
          text = md.post_match
        end
        attr
      end
  end
end