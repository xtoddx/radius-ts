# line 1 "pre_parse.rl"
# line 49 "pre_parse.rl"


module Radius
  class Scanner
    attr_reader :prefix, :starttag, :attrs, :flavor, :prematch
    
    def initialize(data)
      @data = data
      @prematch = ''
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
    	
# line 39 "pre_parse.rb"
class << self
	attr_accessor :_pre_parse_actions
	private :_pre_parse_actions, :_pre_parse_actions=
end
self._pre_parse_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 1, 13, 2, 0, 1, 
	2, 1, 2, 2, 2, 3, 2, 4, 
	5, 2, 5, 7, 2, 9, 4, 2, 
	9, 10, 2, 10, 9, 3, 4, 5, 
	7, 3, 9, 4, 5, 4, 9, 4, 
	5, 7
]

class << self
	attr_accessor :_pre_parse_key_offsets
	private :_pre_parse_key_offsets, :_pre_parse_key_offsets=
end
self._pre_parse_key_offsets = [
	0, 0, 10, 21, 35, 48, 62, 66, 
	71, 73, 75, 88, 101, 102, 104, 119, 
	134, 150, 156, 162, 177, 180, 183, 186, 
	201, 203, 205, 220, 236, 242, 248, 251, 
	254, 270, 286, 303, 310, 316, 332, 336, 
	352, 367, 370, 372, 386, 397, 408, 423, 
	427, 442, 443, 443, 443, 445, 447, 450, 
	453, 455, 457
]

class << self
	attr_accessor :_pre_parse_trans_keys
	private :_pre_parse_trans_keys, :_pre_parse_trans_keys=
end
self._pre_parse_trans_keys = [
	47, 58, 63, 95, 45, 57, 65, 90, 
	97, 122, 58, 63, 95, 45, 46, 48, 
	57, 65, 90, 97, 122, 32, 58, 63, 
	95, 9, 13, 45, 46, 48, 57, 65, 
	90, 97, 122, 32, 47, 62, 63, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	32, 61, 63, 95, 9, 13, 45, 46, 
	48, 58, 65, 90, 97, 122, 32, 61, 
	9, 13, 32, 34, 39, 9, 13, 34, 
	92, 34, 92, 32, 47, 62, 63, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	32, 47, 62, 63, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 62, 34, 92, 
	32, 34, 47, 62, 63, 92, 95, 9, 
	13, 45, 58, 65, 90, 97, 122, 32, 
	34, 47, 62, 63, 92, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 32, 34, 
	61, 63, 92, 95, 9, 13, 45, 46, 
	48, 58, 65, 90, 97, 122, 32, 34, 
	61, 92, 9, 13, 32, 34, 39, 92, 
	9, 13, 32, 34, 47, 62, 63, 92, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 34, 62, 92, 34, 39, 92, 34, 
	39, 92, 32, 39, 47, 62, 63, 92, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 39, 92, 39, 92, 32, 39, 47, 
	62, 63, 92, 95, 9, 13, 45, 58, 
	65, 90, 97, 122, 32, 39, 61, 63, 
	92, 95, 9, 13, 45, 46, 48, 58, 
	65, 90, 97, 122, 32, 39, 61, 92, 
	9, 13, 32, 34, 39, 92, 9, 13, 
	34, 39, 92, 34, 39, 92, 32, 34, 
	39, 47, 62, 63, 92, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 32, 34, 
	39, 47, 62, 63, 92, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 32, 34, 
	39, 61, 63, 92, 95, 9, 13, 45, 
	46, 48, 58, 65, 90, 97, 122, 32, 
	34, 39, 61, 92, 9, 13, 32, 34, 
	39, 92, 9, 13, 32, 34, 39, 47, 
	62, 63, 92, 95, 9, 13, 45, 58, 
	65, 90, 97, 122, 34, 39, 62, 92, 
	32, 34, 39, 47, 62, 63, 92, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	32, 39, 47, 62, 63, 92, 95, 9, 
	13, 45, 58, 65, 90, 97, 122, 39, 
	62, 92, 39, 92, 32, 58, 63, 95, 
	9, 13, 45, 46, 48, 57, 65, 90, 
	97, 122, 58, 63, 95, 45, 46, 48, 
	57, 65, 90, 97, 122, 58, 63, 95, 
	45, 46, 48, 57, 65, 90, 97, 122, 
	32, 58, 62, 63, 95, 9, 13, 45, 
	46, 48, 57, 65, 90, 97, 122, 32, 
	62, 9, 13, 32, 58, 62, 63, 95, 
	9, 13, 45, 46, 48, 57, 65, 90, 
	97, 122, 60, 34, 92, 34, 92, 34, 
	39, 92, 34, 39, 92, 39, 92, 39, 
	92, 0
]

class << self
	attr_accessor :_pre_parse_single_lengths
	private :_pre_parse_single_lengths, :_pre_parse_single_lengths=
end
self._pre_parse_single_lengths = [
	0, 4, 3, 4, 5, 4, 2, 3, 
	2, 2, 5, 5, 1, 2, 7, 7, 
	6, 4, 4, 7, 3, 3, 3, 7, 
	2, 2, 7, 6, 4, 4, 3, 3, 
	8, 8, 7, 5, 4, 8, 4, 8, 
	7, 3, 2, 4, 3, 3, 5, 2, 
	5, 1, 0, 0, 2, 2, 3, 3, 
	2, 2, 0
]

class << self
	attr_accessor :_pre_parse_range_lengths
	private :_pre_parse_range_lengths, :_pre_parse_range_lengths=
end
self._pre_parse_range_lengths = [
	0, 3, 4, 5, 4, 5, 1, 1, 
	0, 0, 4, 4, 0, 0, 4, 4, 
	5, 1, 1, 4, 0, 0, 0, 4, 
	0, 0, 4, 5, 1, 1, 0, 0, 
	4, 4, 5, 1, 1, 4, 0, 4, 
	4, 0, 0, 5, 4, 4, 5, 1, 
	5, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_pre_parse_index_offsets
	private :_pre_parse_index_offsets, :_pre_parse_index_offsets=
end
self._pre_parse_index_offsets = [
	0, 0, 8, 16, 26, 36, 46, 50, 
	55, 58, 61, 71, 81, 83, 86, 98, 
	110, 122, 128, 134, 146, 150, 154, 158, 
	170, 173, 176, 188, 200, 206, 212, 216, 
	220, 233, 246, 259, 266, 272, 285, 290, 
	303, 315, 319, 322, 332, 340, 348, 359, 
	363, 374, 376, 377, 378, 381, 384, 388, 
	392, 395, 398
]

class << self
	attr_accessor :_pre_parse_indicies
	private :_pre_parse_indicies, :_pre_parse_indicies=
end
self._pre_parse_indicies = [
	2, 3, 0, 0, 0, 0, 0, 1, 
	5, 4, 4, 4, 4, 4, 4, 1, 
	6, 8, 7, 7, 6, 7, 7, 7, 
	7, 1, 9, 11, 12, 10, 10, 9, 
	10, 10, 10, 1, 13, 15, 14, 14, 
	13, 14, 14, 14, 14, 1, 16, 17, 
	16, 1, 17, 18, 19, 17, 1, 21, 
	22, 20, 24, 25, 23, 26, 28, 29, 
	27, 27, 26, 27, 27, 27, 1, 30, 
	32, 33, 31, 31, 30, 31, 31, 31, 
	1, 34, 1, 35, 25, 23, 36, 24, 
	38, 39, 37, 25, 37, 36, 37, 37, 
	37, 23, 40, 24, 42, 43, 41, 25, 
	41, 40, 41, 41, 41, 23, 44, 24, 
	46, 45, 25, 45, 44, 45, 45, 45, 
	45, 23, 47, 24, 48, 25, 47, 23, 
	48, 49, 50, 25, 48, 23, 51, 21, 
	53, 54, 52, 22, 52, 51, 52, 52, 
	52, 20, 24, 55, 25, 23, 57, 58, 
	59, 56, 61, 35, 62, 60, 64, 24, 
	66, 67, 65, 68, 65, 64, 65, 65, 
	65, 63, 24, 68, 63, 61, 68, 63, 
	69, 24, 71, 72, 70, 68, 70, 69, 
	70, 70, 70, 63, 73, 24, 75, 74, 
	68, 74, 73, 74, 74, 74, 74, 63, 
	76, 24, 77, 68, 76, 63, 77, 78, 
	79, 68, 77, 63, 80, 58, 59, 56, 
	81, 81, 62, 60, 82, 61, 35, 84, 
	85, 83, 62, 83, 82, 83, 83, 83, 
	60, 86, 61, 35, 88, 89, 87, 62, 
	87, 86, 87, 87, 87, 60, 90, 61, 
	35, 92, 91, 62, 91, 90, 91, 91, 
	91, 91, 60, 93, 61, 35, 94, 62, 
	93, 60, 94, 95, 96, 62, 94, 60, 
	97, 80, 58, 99, 100, 98, 59, 98, 
	97, 98, 98, 98, 56, 61, 35, 101, 
	62, 60, 97, 57, 58, 99, 100, 98, 
	59, 98, 97, 98, 98, 98, 56, 103, 
	21, 105, 106, 104, 107, 104, 103, 104, 
	104, 104, 102, 24, 108, 68, 63, 21, 
	107, 102, 109, 5, 110, 110, 109, 110, 
	110, 110, 110, 1, 112, 111, 111, 111, 
	111, 111, 111, 1, 114, 113, 113, 113, 
	113, 113, 113, 1, 115, 117, 118, 116, 
	116, 115, 116, 116, 116, 116, 1, 119, 
	120, 119, 1, 121, 114, 123, 122, 122, 
	121, 122, 122, 122, 122, 1, 125, 124, 
	1, 1, 24, 25, 23, 24, 25, 23, 
	61, 35, 62, 60, 61, 35, 62, 60, 
	24, 68, 63, 24, 68, 63, 1, 0
]

class << self
	attr_accessor :_pre_parse_trans_targs
	private :_pre_parse_trans_targs, :_pre_parse_trans_targs=
end
self._pre_parse_trans_targs = [
	2, 0, 44, 3, 2, 3, 4, 43, 
	3, 4, 5, 12, 51, 6, 5, 7, 
	6, 7, 8, 42, 9, 10, 13, 9, 
	10, 13, 11, 5, 12, 51, 11, 5, 
	12, 51, 50, 14, 15, 16, 20, 53, 
	15, 16, 20, 53, 17, 16, 18, 17, 
	18, 19, 21, 15, 16, 20, 53, 52, 
	22, 23, 14, 31, 22, 23, 31, 24, 
	26, 27, 41, 57, 25, 26, 27, 41, 
	57, 28, 27, 29, 28, 29, 30, 40, 
	23, 32, 33, 34, 38, 55, 33, 34, 
	38, 55, 35, 34, 36, 35, 36, 37, 
	39, 33, 34, 38, 55, 54, 24, 26, 
	27, 41, 57, 25, 56, 4, 43, 45, 
	46, 45, 46, 47, 48, 46, 58, 47, 
	58, 47, 48, 58, 49, 1
]

class << self
	attr_accessor :_pre_parse_trans_actions
	private :_pre_parse_trans_actions, :_pre_parse_trans_actions=
end
self._pre_parse_trans_actions = [
	1, 0, 0, 29, 0, 3, 35, 5, 
	32, 0, 15, 0, 0, 17, 0, 17, 
	0, 0, 0, 0, 19, 47, 19, 0, 
	21, 0, 9, 53, 38, 38, 0, 41, 
	11, 11, 0, 21, 9, 53, 38, 38, 
	0, 41, 11, 11, 17, 0, 17, 0, 
	0, 21, 0, 44, 61, 57, 57, 0, 
	19, 50, 47, 19, 0, 21, 0, 0, 
	9, 53, 38, 38, 0, 0, 41, 11, 
	11, 17, 0, 17, 0, 0, 0, 21, 
	47, 21, 9, 53, 38, 38, 0, 41, 
	11, 11, 17, 0, 17, 0, 0, 21, 
	21, 44, 61, 57, 57, 0, 19, 44, 
	61, 57, 57, 19, 0, 7, 0, 1, 
	29, 0, 3, 35, 5, 32, 35, 0, 
	0, 7, 0, 7, 0, 13
]

class << self
	attr_accessor :_pre_parse_eof_actions
	private :_pre_parse_eof_actions, :_pre_parse_eof_actions=
end
self._pre_parse_eof_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 13, 25, 23, 25, 23, 25, 23, 
	25, 23, 27
]

class << self
	attr_accessor :pre_parse_start
end
self.pre_parse_start = 49;
class << self
	attr_accessor :pre_parse_first_final
end
self.pre_parse_first_final = 49;
class << self
	attr_accessor :pre_parse_error
end
self.pre_parse_error = 0;

class << self
	attr_accessor :pre_parse_en_main
end
self.pre_parse_en_main = 49;

# line 84 "pre_parse.rl"
    	
# line 319 "pre_parse.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = pre_parse_start
end
# line 85 "pre_parse.rl"
    	
# line 327 "pre_parse.rb"
begin
	_klen, _trans, _keys, _acts, _nacts = nil
	_goto_level = 0
	_resume = 10
	_eof_trans = 15
	_again = 20
	_test_eof = 30
	_out = 40
	while true
	_trigger_goto = false
	if _goto_level <= 0
	if p == pe
		_goto_level = _test_eof
		next
	end
	if cs == 0
		_goto_level = _out
		next
	end
	end
	if _goto_level <= _resume
	_keys = _pre_parse_key_offsets[cs]
	_trans = _pre_parse_index_offsets[cs]
	_klen = _pre_parse_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _pre_parse_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _pre_parse_trans_keys[_mid]
	           _lower = _mid + 1
	        else
	           _trans += (_mid - _keys)
	           _break_match = true
	           break
	        end
	     end # loop
	     break if _break_match
	     _keys += _klen
	     _trans += _klen
	  end
	  _klen = _pre_parse_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _pre_parse_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _pre_parse_trans_keys[_mid+1]
	          _lower = _mid + 2
	        else
	          _trans += ((_mid - _keys) >> 1)
	          _break_match = true
	          break
	        end
	     end # loop
	     break if _break_match
	     _trans += _klen
	  end
	end while false
	_trans = _pre_parse_indicies[_trans]
	cs = _pre_parse_trans_targs[_trans]
	if _pre_parse_trans_actions[_trans] != 0
		_acts = _pre_parse_trans_actions[_trans]
		_nacts = _pre_parse_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _pre_parse_actions[_acts - 1]
when 0 then
# line 4 "pre_parse.rl"
		begin
 mark_pfx = p 		end
# line 4 "pre_parse.rl"
when 1 then
# line 5 "pre_parse.rl"
		begin
 @prefix = data[mark_pfx..p-1] 		end
# line 5 "pre_parse.rl"
when 2 then
# line 6 "pre_parse.rl"
		begin
 mark_stg = p 		end
# line 6 "pre_parse.rl"
when 3 then
# line 7 "pre_parse.rl"
		begin
 @starttag = data[mark_stg..p-1] 		end
# line 7 "pre_parse.rl"
when 4 then
# line 8 "pre_parse.rl"
		begin
 mark_attr = p 		end
# line 8 "pre_parse.rl"
when 5 then
# line 9 "pre_parse.rl"
		begin

	  @attrs[@nat] = @vat 
			end
# line 9 "pre_parse.rl"
when 6 then
# line 13 "pre_parse.rl"
		begin
 @prematch = data[0..p] if p > 0 		end
# line 13 "pre_parse.rl"
when 7 then
# line 15 "pre_parse.rl"
		begin
 mark_nat = p 		end
# line 15 "pre_parse.rl"
when 8 then
# line 16 "pre_parse.rl"
		begin
 @nat = data[mark_nat..p-1] 		end
# line 16 "pre_parse.rl"
when 9 then
# line 17 "pre_parse.rl"
		begin
 mark_vat = p 		end
# line 17 "pre_parse.rl"
when 10 then
# line 18 "pre_parse.rl"
		begin
 @vat = data[mark_vat..p-1] 		end
# line 18 "pre_parse.rl"
# line 465 "pre_parse.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	if cs == 0
		_goto_level = _out
		next
	end
	p += 1
	if p != pe
		_goto_level = _resume
		next
	end
	end
	if _goto_level <= _test_eof
	if p == eof
	__acts = _pre_parse_eof_actions[cs]
	__nacts =  _pre_parse_actions[__acts]
	__acts += 1
	while __nacts > 0
		__nacts -= 1
		__acts += 1
		case _pre_parse_actions[__acts - 1]
when 6 then
# line 13 "pre_parse.rl"
		begin
 @prematch = data[0..p] if p > 0 		end
# line 13 "pre_parse.rl"
when 11 then
# line 20 "pre_parse.rl"
		begin
 @flavor = :open 		end
# line 20 "pre_parse.rl"
when 12 then
# line 21 "pre_parse.rl"
		begin
 @flavor = :self 		end
# line 21 "pre_parse.rl"
when 13 then
# line 22 "pre_parse.rl"
		begin
 @flavor = :close 		end
# line 22 "pre_parse.rl"
# line 513 "pre_parse.rb"
		end # eof action switch
	end
	if _trigger_goto
		next
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end
# line 86 "pre_parse.rl"
    	@cursor = p
    end
  end
end