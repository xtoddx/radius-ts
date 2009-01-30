%%{
	machine pre_parse;
	
	action _prefix { mark_pfx = p }
	action prefix { @prefix = data[mark_pfx..p-1] }
	action _starttag { mark_stg = p }
	action starttag { @starttag = data[mark_stg..p-1] }
	action _attr { mark_attr = p }
	action attr {
	  @attrs[@nat] = @vat 
	}
	
	action prematch { @prematch = data[0..p-1] }
	
	action _nameattr { mark_nat = p }
	action nameattr { @nat = data[mark_nat..p-1] }
	action _valattr { mark_vat = p }
	action valattr { @vat = data[mark_vat..p-1] }
	
	action opentag { @flavor = :open }
	action selftag { @flavor = :self }
	action closetag { @flavor = :close }
	
	# words
	NameChar = [\-A-Za-z0-9._:?] ;
	TagName = NameChar* >_starttag %starttag;
	Prefix = NameChar* >_prefix %prefix;
	
	Name = Prefix ":" TagName;
	
	NameAttr = NameChar+ >_nameattr %nameattr;
  Q1Char = ( "\\\'" | [^'] ) ;
  Q1Attr = Q1Char* >_valattr %valattr;
  Q2Char = ( "\\\"" | [^"] ) ;
  Q2Attr = Q2Char* >_valattr %valattr;
 
  Attr =  NameAttr space* "=" space* ('"' Q2Attr '"' | "'" Q1Attr "'") space* >_attr %attr;
  Attrs = (space+ Attr* | empty);
  
  SelfClose = "/>" %selftag;
  Trailer = ">" %opentag;
  
	OpenOrSelfTag = "<" Name Attrs (SelfClose | Trailer);
	CloseTag = "</" Name space* ">" %closetag;
	
	PreMatch = (^"<")* %prematch;
	
	main := PreMatch (OpenOrSelfTag | CloseTag)?;
}%%

module Radius
  class Scanner
    attr_reader :prefix, :starttag, :attrs, :flavor, :prematch
    
    def initialize(data)
      @data = data
      @prematch = nil
    	@prefix = nil
    	@starttag = nil
    	@attrs = {}
    	@flavor = :tasteless
    	@cursor = 0
    end
    
    def parse
    	parse_with_stack(@data, [])
    end
    
    def inspect
      "<Radius::Scanner prefix=#{@prefix.inspect} tag=#{@starttag.inspect} flavor=#{@flavor.inspect} cursor=#{@cursor} attrs=#{@attrs.inspect}>"
    end
    
    def leftover
      @data[@cursor..-1]
    end
    
    private
    def parse_with_stack(data, selstack)
    	buf = ""
    	csel = ""
      stack = []
      eof = data.length
    	%% write data;
    	%% write init;
    	%% write exec;
    	@cursor = p
    end
  end
end