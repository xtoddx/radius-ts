# line 1 "pre_parse.rl"
# line 45 "pre_parse.rl"


module Radius
  class Scanner
    def initialize(data)
      @data = data
    	@prefix = nil
    	@starttag = nil
    	@attrs = {}
    	@flavor = :tasteless
    end
    
    def parse
    	parse_with_stack(@data, [])
    end
    
    def inspect
      "<Radius::Scanner prefix=#{@prefix.inspect} tag=#{@starttag.inspect} flavor=#{@flavor.inspect} attrs=#{@attrs.inspect}>"
    end
    
    private
    def parse_with_stack(data, selstack)
    	buf = ""
    	csel = ""
      stack = []
      eof = data.length
    	
# line 31 "pre_parse.rb"
class << self
	attr_accessor :_pre_parse_actions
	private :_pre_parse_actions, :_pre_parse_actions=
end
self._pre_parse_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 5, 1, 6, 1, 
	7, 1, 8, 1, 9, 1, 10, 1, 
	11, 1, 12, 2, 0, 1, 2, 1, 
	2, 2, 2, 3, 2, 4, 5, 2, 
	5, 6, 2, 8, 4, 2, 8, 9, 
	2, 9, 8, 3, 4, 5, 6, 3, 
	8, 4, 5, 4, 8, 4, 5, 6
]

class << self
	attr_accessor :_pre_parse_key_offsets
	private :_pre_parse_key_offsets, :_pre_parse_key_offsets=
end
self._pre_parse_key_offsets = [
	0, 0, 1, 11, 22, 36, 49, 63, 
	67, 72, 74, 76, 89, 102, 103, 105, 
	120, 135, 151, 157, 163, 178, 181, 184, 
	187, 202, 204, 206, 221, 237, 243, 249, 
	252, 255, 271, 287, 304, 311, 317, 333, 
	337, 353, 368, 371, 373, 387, 398, 409, 
	424, 428, 443, 443, 443, 445, 447, 450, 
	453, 455, 457
]

class << self
	attr_accessor :_pre_parse_trans_keys
	private :_pre_parse_trans_keys, :_pre_parse_trans_keys=
end
self._pre_parse_trans_keys = [
	60, 47, 58, 63, 95, 45, 57, 65, 
	90, 97, 122, 58, 63, 95, 45, 46, 
	48, 57, 65, 90, 97, 122, 32, 58, 
	63, 95, 9, 13, 45, 46, 48, 57, 
	65, 90, 97, 122, 32, 47, 62, 63, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 32, 61, 63, 95, 9, 13, 45, 
	46, 48, 58, 65, 90, 97, 122, 32, 
	61, 9, 13, 32, 34, 39, 9, 13, 
	34, 92, 34, 92, 32, 47, 62, 63, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 32, 47, 62, 63, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 62, 34, 
	92, 32, 34, 47, 62, 63, 92, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	32, 34, 47, 62, 63, 92, 95, 9, 
	13, 45, 58, 65, 90, 97, 122, 32, 
	34, 61, 63, 92, 95, 9, 13, 45, 
	46, 48, 58, 65, 90, 97, 122, 32, 
	34, 61, 92, 9, 13, 32, 34, 39, 
	92, 9, 13, 32, 34, 47, 62, 63, 
	92, 95, 9, 13, 45, 58, 65, 90, 
	97, 122, 34, 62, 92, 34, 39, 92, 
	34, 39, 92, 32, 39, 47, 62, 63, 
	92, 95, 9, 13, 45, 58, 65, 90, 
	97, 122, 39, 92, 39, 92, 32, 39, 
	47, 62, 63, 92, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 32, 39, 61, 
	63, 92, 95, 9, 13, 45, 46, 48, 
	58, 65, 90, 97, 122, 32, 39, 61, 
	92, 9, 13, 32, 34, 39, 92, 9, 
	13, 34, 39, 92, 34, 39, 92, 32, 
	34, 39, 47, 62, 63, 92, 95, 9, 
	13, 45, 58, 65, 90, 97, 122, 32, 
	34, 39, 47, 62, 63, 92, 95, 9, 
	13, 45, 58, 65, 90, 97, 122, 32, 
	34, 39, 61, 63, 92, 95, 9, 13, 
	45, 46, 48, 58, 65, 90, 97, 122, 
	32, 34, 39, 61, 92, 9, 13, 32, 
	34, 39, 92, 9, 13, 32, 34, 39, 
	47, 62, 63, 92, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 34, 39, 62, 
	92, 32, 34, 39, 47, 62, 63, 92, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 32, 39, 47, 62, 63, 92, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	39, 62, 92, 39, 92, 32, 58, 63, 
	95, 9, 13, 45, 46, 48, 57, 65, 
	90, 97, 122, 58, 63, 95, 45, 46, 
	48, 57, 65, 90, 97, 122, 58, 63, 
	95, 45, 46, 48, 57, 65, 90, 97, 
	122, 32, 58, 62, 63, 95, 9, 13, 
	45, 46, 48, 57, 65, 90, 97, 122, 
	32, 62, 9, 13, 32, 58, 62, 63, 
	95, 9, 13, 45, 46, 48, 57, 65, 
	90, 97, 122, 34, 92, 34, 92, 34, 
	39, 92, 34, 39, 92, 39, 92, 39, 
	92, 0
]

class << self
	attr_accessor :_pre_parse_single_lengths
	private :_pre_parse_single_lengths, :_pre_parse_single_lengths=
end
self._pre_parse_single_lengths = [
	0, 1, 4, 3, 4, 5, 4, 2, 
	3, 2, 2, 5, 5, 1, 2, 7, 
	7, 6, 4, 4, 7, 3, 3, 3, 
	7, 2, 2, 7, 6, 4, 4, 3, 
	3, 8, 8, 7, 5, 4, 8, 4, 
	8, 7, 3, 2, 4, 3, 3, 5, 
	2, 5, 0, 0, 2, 2, 3, 3, 
	2, 2, 0
]

class << self
	attr_accessor :_pre_parse_range_lengths
	private :_pre_parse_range_lengths, :_pre_parse_range_lengths=
end
self._pre_parse_range_lengths = [
	0, 0, 3, 4, 5, 4, 5, 1, 
	1, 0, 0, 4, 4, 0, 0, 4, 
	4, 5, 1, 1, 4, 0, 0, 0, 
	4, 0, 0, 4, 5, 1, 1, 0, 
	0, 4, 4, 5, 1, 1, 4, 0, 
	4, 4, 0, 0, 5, 4, 4, 5, 
	1, 5, 0, 0, 0, 0, 0, 0, 
	0, 0, 0
]

class << self
	attr_accessor :_pre_parse_index_offsets
	private :_pre_parse_index_offsets, :_pre_parse_index_offsets=
end
self._pre_parse_index_offsets = [
	0, 0, 2, 10, 18, 28, 38, 48, 
	52, 57, 60, 63, 73, 83, 85, 88, 
	100, 112, 124, 130, 136, 148, 152, 156, 
	160, 172, 175, 178, 190, 202, 208, 214, 
	218, 222, 235, 248, 261, 268, 274, 287, 
	292, 305, 317, 321, 324, 334, 342, 350, 
	361, 365, 376, 377, 378, 381, 384, 388, 
	392, 395, 398
]

class << self
	attr_accessor :_pre_parse_indicies
	private :_pre_parse_indicies, :_pre_parse_indicies=
end
self._pre_parse_indicies = [
	0, 1, 3, 4, 2, 2, 2, 2, 
	2, 1, 6, 5, 5, 5, 5, 5, 
	5, 1, 7, 9, 8, 8, 7, 8, 
	8, 8, 8, 1, 10, 12, 13, 11, 
	11, 10, 11, 11, 11, 1, 14, 16, 
	15, 15, 14, 15, 15, 15, 15, 1, 
	17, 18, 17, 1, 18, 19, 20, 18, 
	1, 22, 23, 21, 25, 26, 24, 27, 
	29, 30, 28, 28, 27, 28, 28, 28, 
	1, 31, 33, 34, 32, 32, 31, 32, 
	32, 32, 1, 35, 1, 36, 26, 24, 
	37, 25, 39, 40, 38, 26, 38, 37, 
	38, 38, 38, 24, 41, 25, 43, 44, 
	42, 26, 42, 41, 42, 42, 42, 24, 
	45, 25, 47, 46, 26, 46, 45, 46, 
	46, 46, 46, 24, 48, 25, 49, 26, 
	48, 24, 49, 50, 51, 26, 49, 24, 
	52, 22, 54, 55, 53, 23, 53, 52, 
	53, 53, 53, 21, 25, 56, 26, 24, 
	58, 59, 60, 57, 62, 36, 63, 61, 
	65, 25, 67, 68, 66, 69, 66, 65, 
	66, 66, 66, 64, 25, 69, 64, 62, 
	69, 64, 70, 25, 72, 73, 71, 69, 
	71, 70, 71, 71, 71, 64, 74, 25, 
	76, 75, 69, 75, 74, 75, 75, 75, 
	75, 64, 77, 25, 78, 69, 77, 64, 
	78, 79, 80, 69, 78, 64, 81, 59, 
	60, 57, 82, 82, 63, 61, 83, 62, 
	36, 85, 86, 84, 63, 84, 83, 84, 
	84, 84, 61, 87, 62, 36, 89, 90, 
	88, 63, 88, 87, 88, 88, 88, 61, 
	91, 62, 36, 93, 92, 63, 92, 91, 
	92, 92, 92, 92, 61, 94, 62, 36, 
	95, 63, 94, 61, 95, 96, 97, 63, 
	95, 61, 98, 81, 59, 100, 101, 99, 
	60, 99, 98, 99, 99, 99, 57, 62, 
	36, 102, 63, 61, 98, 58, 59, 100, 
	101, 99, 60, 99, 98, 99, 99, 99, 
	57, 104, 22, 106, 107, 105, 108, 105, 
	104, 105, 105, 105, 103, 25, 109, 69, 
	64, 22, 108, 103, 110, 6, 111, 111, 
	110, 111, 111, 111, 111, 1, 113, 112, 
	112, 112, 112, 112, 112, 1, 115, 114, 
	114, 114, 114, 114, 114, 1, 116, 118, 
	119, 117, 117, 116, 117, 117, 117, 117, 
	1, 120, 121, 120, 1, 122, 115, 124, 
	123, 123, 122, 123, 123, 123, 123, 1, 
	1, 1, 25, 26, 24, 25, 26, 24, 
	62, 36, 63, 61, 62, 36, 63, 61, 
	25, 69, 64, 25, 69, 64, 1, 0
]

class << self
	attr_accessor :_pre_parse_trans_targs
	private :_pre_parse_trans_targs, :_pre_parse_trans_targs=
end
self._pre_parse_trans_targs = [
	2, 0, 3, 45, 4, 3, 4, 5, 
	44, 4, 5, 6, 13, 51, 7, 6, 
	8, 7, 8, 9, 43, 10, 11, 14, 
	10, 11, 14, 12, 6, 13, 51, 12, 
	6, 13, 51, 50, 15, 16, 17, 21, 
	53, 16, 17, 21, 53, 18, 17, 19, 
	18, 19, 20, 22, 16, 17, 21, 53, 
	52, 23, 24, 15, 32, 23, 24, 32, 
	25, 27, 28, 42, 57, 26, 27, 28, 
	42, 57, 29, 28, 30, 29, 30, 31, 
	41, 24, 33, 34, 35, 39, 55, 34, 
	35, 39, 55, 36, 35, 37, 36, 37, 
	38, 40, 34, 35, 39, 55, 54, 25, 
	27, 28, 42, 57, 26, 56, 5, 44, 
	46, 47, 46, 47, 48, 49, 47, 58, 
	48, 58, 48, 49, 58
]

class << self
	attr_accessor :_pre_parse_trans_actions
	private :_pre_parse_trans_actions, :_pre_parse_trans_actions=
end
self._pre_parse_trans_actions = [
	0, 0, 1, 0, 27, 0, 3, 33, 
	5, 30, 0, 13, 0, 0, 15, 0, 
	15, 0, 0, 0, 0, 17, 45, 17, 
	0, 19, 0, 9, 51, 36, 36, 0, 
	39, 11, 11, 0, 19, 9, 51, 36, 
	36, 0, 39, 11, 11, 15, 0, 15, 
	0, 0, 19, 0, 42, 59, 55, 55, 
	0, 17, 48, 45, 17, 0, 19, 0, 
	0, 9, 51, 36, 36, 0, 0, 39, 
	11, 11, 15, 0, 15, 0, 0, 0, 
	19, 45, 19, 9, 51, 36, 36, 0, 
	39, 11, 11, 15, 0, 15, 0, 0, 
	19, 19, 42, 59, 55, 55, 0, 17, 
	42, 59, 55, 55, 17, 0, 7, 0, 
	1, 27, 0, 3, 33, 5, 30, 33, 
	0, 0, 7, 0, 7
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
	0, 0, 23, 21, 23, 21, 23, 21, 
	23, 21, 25
]

class << self
	attr_accessor :pre_parse_start
end
self.pre_parse_start = 1;
class << self
	attr_accessor :pre_parse_first_final
end
self.pre_parse_first_final = 50;
class << self
	attr_accessor :pre_parse_error
end
self.pre_parse_error = 0;

class << self
	attr_accessor :pre_parse_en_main
end
self.pre_parse_en_main = 1;

# line 72 "pre_parse.rl"
    	
# line 310 "pre_parse.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = pre_parse_start
end
# line 73 "pre_parse.rl"
    	
# line 318 "pre_parse.rb"
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
 mark_nat = p 		end
# line 13 "pre_parse.rl"
when 7 then
# line 14 "pre_parse.rl"
		begin
 @nat = data[mark_nat..p-1] 		end
# line 14 "pre_parse.rl"
when 8 then
# line 15 "pre_parse.rl"
		begin
 mark_vat = p 		end
# line 15 "pre_parse.rl"
when 9 then
# line 16 "pre_parse.rl"
		begin
 @vat = data[mark_vat..p-1] 		end
# line 16 "pre_parse.rl"
# line 451 "pre_parse.rb"
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
when 10 then
# line 18 "pre_parse.rl"
		begin
 @flavor = :open 		end
# line 18 "pre_parse.rl"
when 11 then
# line 19 "pre_parse.rl"
		begin
 @flavor = :self 		end
# line 19 "pre_parse.rl"
when 12 then
# line 20 "pre_parse.rl"
		begin
 @flavor = :close 		end
# line 20 "pre_parse.rl"
# line 494 "pre_parse.rb"
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
# line 74 "pre_parse.rl"
    end
  end
end