# line 1 "scan.rl"
# line 85 "scan.rl"


module Radius
  class Scanner
    def self.operate(prefix, data)
      buf = ""
      csel = ""
      stack = []
      p = 0
      eof = data.length
      @prematch = ''
      @prefix = prefix
      @starttag = nil
      @attrs = {}
      @flavor = :tasteless
      @cursor = 0
      @tagstart = 0
      @nodes = ['']

      
# line 24 "scan.rb"
class << self
	attr_accessor :_parser_actions
	private :_parser_actions, :_parser_actions=
end
self._parser_actions = [
	0, 1, 0, 1, 1, 1, 2, 1, 
	3, 1, 4, 1, 6, 1, 7, 1, 
	8, 1, 9, 1, 18, 1, 19, 1, 
	23, 1, 25, 1, 26, 1, 27, 2, 
	0, 1, 2, 2, 3, 2, 5, 6, 
	2, 8, 4, 2, 8, 9, 2, 9, 
	8, 2, 10, 24, 2, 11, 24, 2, 
	12, 24, 2, 17, 26, 2, 17, 27, 
	2, 20, 21, 2, 20, 22, 3, 3, 
	16, 14, 3, 3, 16, 15, 3, 4, 
	5, 6, 3, 13, 16, 14, 3, 13, 
	16, 15, 4, 2, 3, 16, 14, 4, 
	2, 3, 16, 15, 4, 5, 13, 16, 
	14, 4, 5, 13, 16, 15, 4, 8, 
	4, 5, 6, 5, 4, 5, 13, 16, 
	14, 5, 4, 5, 13, 16, 15, 6, 
	8, 4, 5, 13, 16, 14, 6, 20, 
	5, 13, 16, 15, 21, 7, 20, 4, 
	5, 13, 16, 15, 21, 8, 20, 8, 
	4, 5, 13, 16, 15, 21
]

class << self
	attr_accessor :_parser_key_offsets
	private :_parser_key_offsets, :_parser_key_offsets=
end
self._parser_key_offsets = [
	0, 0, 11, 24, 37, 51, 55, 60, 
	62, 64, 77, 90, 91, 93, 108, 123, 
	139, 145, 151, 166, 169, 172, 175, 190, 
	192, 194, 209, 225, 231, 237, 240, 243, 
	259, 275, 292, 299, 305, 321, 325, 341, 
	356, 359, 361, 374, 385, 396, 410, 414, 
	428, 428, 429, 439, 439, 439, 441, 443, 
	446, 449, 451, 453
]

class << self
	attr_accessor :_parser_trans_keys
	private :_parser_trans_keys, :_parser_trans_keys=
end
self._parser_trans_keys = [
	58, 63, 95, 45, 46, 48, 57, 65, 
	90, 97, 122, 32, 47, 62, 63, 95, 
	9, 13, 45, 58, 65, 90, 97, 122, 
	32, 47, 62, 63, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 32, 61, 63, 
	95, 9, 13, 45, 46, 48, 58, 65, 
	90, 97, 122, 32, 61, 9, 13, 32, 
	34, 39, 9, 13, 34, 92, 34, 92, 
	32, 47, 62, 63, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 32, 47, 62, 
	63, 95, 9, 13, 45, 58, 65, 90, 
	97, 122, 62, 34, 92, 32, 34, 47, 
	62, 63, 92, 95, 9, 13, 45, 58, 
	65, 90, 97, 122, 32, 34, 47, 62, 
	63, 92, 95, 9, 13, 45, 58, 65, 
	90, 97, 122, 32, 34, 61, 63, 92, 
	95, 9, 13, 45, 46, 48, 58, 65, 
	90, 97, 122, 32, 34, 61, 92, 9, 
	13, 32, 34, 39, 92, 9, 13, 32, 
	34, 47, 62, 63, 92, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 34, 62, 
	92, 34, 39, 92, 34, 39, 92, 32, 
	39, 47, 62, 63, 92, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 39, 92, 
	39, 92, 32, 39, 47, 62, 63, 92, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 32, 39, 61, 63, 92, 95, 9, 
	13, 45, 46, 48, 58, 65, 90, 97, 
	122, 32, 39, 61, 92, 9, 13, 32, 
	34, 39, 92, 9, 13, 34, 39, 92, 
	34, 39, 92, 32, 34, 39, 47, 62, 
	63, 92, 95, 9, 13, 45, 58, 65, 
	90, 97, 122, 32, 34, 39, 47, 62, 
	63, 92, 95, 9, 13, 45, 58, 65, 
	90, 97, 122, 32, 34, 39, 61, 63, 
	92, 95, 9, 13, 45, 46, 48, 58, 
	65, 90, 97, 122, 32, 34, 39, 61, 
	92, 9, 13, 32, 34, 39, 92, 9, 
	13, 32, 34, 39, 47, 62, 63, 92, 
	95, 9, 13, 45, 58, 65, 90, 97, 
	122, 34, 39, 62, 92, 32, 34, 39, 
	47, 62, 63, 92, 95, 9, 13, 45, 
	58, 65, 90, 97, 122, 32, 39, 47, 
	62, 63, 92, 95, 9, 13, 45, 58, 
	65, 90, 97, 122, 39, 62, 92, 39, 
	92, 32, 47, 62, 63, 95, 9, 13, 
	45, 58, 65, 90, 97, 122, 58, 63, 
	95, 45, 46, 48, 57, 65, 90, 97, 
	122, 58, 63, 95, 45, 46, 48, 57, 
	65, 90, 97, 122, 32, 62, 63, 95, 
	9, 13, 45, 46, 48, 58, 65, 90, 
	97, 122, 32, 62, 9, 13, 32, 62, 
	63, 95, 9, 13, 45, 46, 48, 58, 
	65, 90, 97, 122, 60, 47, 58, 63, 
	95, 45, 57, 65, 90, 97, 122, 34, 
	92, 34, 92, 34, 39, 92, 34, 39, 
	92, 39, 92, 39, 92, 0
]

class << self
	attr_accessor :_parser_single_lengths
	private :_parser_single_lengths, :_parser_single_lengths=
end
self._parser_single_lengths = [
	0, 3, 5, 5, 4, 2, 3, 2, 
	2, 5, 5, 1, 2, 7, 7, 6, 
	4, 4, 7, 3, 3, 3, 7, 2, 
	2, 7, 6, 4, 4, 3, 3, 8, 
	8, 7, 5, 4, 8, 4, 8, 7, 
	3, 2, 5, 3, 3, 4, 2, 4, 
	0, 1, 4, 0, 0, 2, 2, 3, 
	3, 2, 2, 0
]

class << self
	attr_accessor :_parser_range_lengths
	private :_parser_range_lengths, :_parser_range_lengths=
end
self._parser_range_lengths = [
	0, 4, 4, 4, 5, 1, 1, 0, 
	0, 4, 4, 0, 0, 4, 4, 5, 
	1, 1, 4, 0, 0, 0, 4, 0, 
	0, 4, 5, 1, 1, 0, 0, 4, 
	4, 5, 1, 1, 4, 0, 4, 4, 
	0, 0, 4, 4, 4, 5, 1, 5, 
	0, 0, 3, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_parser_index_offsets
	private :_parser_index_offsets, :_parser_index_offsets=
end
self._parser_index_offsets = [
	0, 0, 8, 18, 28, 38, 42, 47, 
	50, 53, 63, 73, 75, 78, 90, 102, 
	114, 120, 126, 138, 142, 146, 150, 162, 
	165, 168, 180, 192, 198, 204, 208, 212, 
	225, 238, 251, 258, 264, 277, 282, 295, 
	307, 311, 314, 324, 332, 340, 350, 354, 
	364, 365, 367, 375, 376, 377, 380, 383, 
	387, 391, 394, 397
]

class << self
	attr_accessor :_parser_trans_targs
	private :_parser_trans_targs, :_parser_trans_targs=
end
self._parser_trans_targs = [
	2, 1, 1, 1, 1, 1, 1, 49, 
	3, 11, 52, 42, 42, 3, 42, 42, 
	42, 49, 3, 11, 52, 4, 4, 3, 
	4, 4, 4, 49, 5, 6, 4, 4, 
	5, 4, 4, 4, 4, 49, 5, 6, 
	5, 49, 6, 7, 41, 6, 49, 9, 
	12, 8, 9, 12, 8, 10, 11, 52, 
	4, 4, 10, 4, 4, 4, 49, 10, 
	11, 52, 4, 4, 10, 4, 4, 4, 
	49, 51, 49, 13, 12, 8, 14, 9, 
	19, 54, 15, 12, 15, 14, 15, 15, 
	15, 8, 14, 9, 19, 54, 15, 12, 
	15, 14, 15, 15, 15, 8, 16, 9, 
	17, 15, 12, 15, 16, 15, 15, 15, 
	15, 8, 16, 9, 17, 12, 16, 8, 
	17, 18, 20, 12, 17, 8, 14, 9, 
	19, 54, 15, 12, 15, 14, 15, 15, 
	15, 8, 9, 53, 12, 8, 22, 13, 
	30, 21, 22, 13, 30, 21, 25, 9, 
	40, 58, 26, 24, 26, 25, 26, 26, 
	26, 23, 9, 24, 23, 22, 24, 23, 
	25, 9, 40, 58, 26, 24, 26, 25, 
	26, 26, 26, 23, 27, 9, 28, 26, 
	24, 26, 27, 26, 26, 26, 26, 23, 
	27, 9, 28, 24, 27, 23, 28, 29, 
	39, 24, 28, 23, 22, 13, 30, 21, 
	31, 31, 30, 21, 32, 22, 13, 37, 
	56, 33, 30, 33, 32, 33, 33, 33, 
	21, 32, 22, 13, 37, 56, 33, 30, 
	33, 32, 33, 33, 33, 21, 34, 22, 
	13, 35, 33, 30, 33, 34, 33, 33, 
	33, 33, 21, 34, 22, 13, 35, 30, 
	34, 21, 35, 36, 38, 30, 35, 21, 
	32, 22, 13, 37, 56, 33, 30, 33, 
	32, 33, 33, 33, 21, 22, 13, 55, 
	30, 21, 32, 22, 13, 37, 56, 33, 
	30, 33, 32, 33, 33, 33, 21, 25, 
	9, 40, 58, 26, 24, 26, 25, 26, 
	26, 26, 23, 9, 57, 24, 23, 9, 
	24, 23, 3, 11, 52, 42, 42, 3, 
	42, 42, 42, 49, 45, 44, 44, 44, 
	44, 44, 44, 49, 45, 44, 44, 44, 
	44, 44, 44, 49, 46, 59, 47, 47, 
	46, 47, 47, 47, 47, 49, 46, 59, 
	46, 49, 46, 59, 47, 47, 46, 47, 
	47, 47, 47, 49, 0, 50, 49, 43, 
	2, 1, 1, 1, 1, 1, 49, 49, 
	49, 9, 12, 8, 9, 12, 8, 22, 
	13, 30, 21, 22, 13, 30, 21, 9, 
	24, 23, 9, 24, 23, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 49, 
	49, 49, 49, 49, 49, 49, 49, 0
]

class << self
	attr_accessor :_parser_trans_actions
	private :_parser_trans_actions, :_parser_trans_actions=
end
self._parser_trans_actions = [
	3, 0, 0, 0, 0, 0, 0, 27, 
	34, 90, 95, 5, 5, 34, 5, 5, 
	5, 27, 0, 82, 86, 11, 11, 0, 
	11, 11, 11, 27, 13, 13, 0, 0, 
	13, 0, 0, 0, 0, 29, 0, 0, 
	0, 29, 0, 0, 0, 0, 29, 43, 
	15, 15, 17, 0, 0, 9, 115, 121, 
	78, 78, 9, 78, 78, 78, 29, 0, 
	100, 105, 37, 37, 0, 37, 37, 37, 
	29, 0, 29, 17, 0, 0, 9, 17, 
	115, 141, 78, 0, 78, 9, 78, 78, 
	78, 0, 0, 17, 100, 134, 37, 0, 
	37, 0, 37, 37, 37, 0, 13, 17, 
	13, 0, 0, 0, 13, 0, 0, 0, 
	0, 0, 0, 17, 0, 0, 0, 0, 
	0, 17, 0, 0, 0, 0, 40, 43, 
	127, 149, 110, 15, 110, 40, 110, 110, 
	110, 15, 17, 64, 0, 0, 46, 43, 
	15, 15, 17, 17, 0, 0, 9, 17, 
	115, 141, 78, 0, 78, 9, 78, 78, 
	78, 0, 17, 0, 0, 17, 0, 0, 
	0, 17, 100, 134, 37, 0, 37, 0, 
	37, 37, 37, 0, 13, 17, 13, 0, 
	0, 0, 13, 0, 0, 0, 0, 0, 
	0, 17, 0, 0, 0, 0, 0, 0, 
	17, 0, 0, 0, 43, 43, 15, 15, 
	17, 17, 0, 0, 9, 17, 17, 115, 
	141, 78, 0, 78, 9, 78, 78, 78, 
	0, 0, 17, 17, 100, 134, 37, 0, 
	37, 0, 37, 37, 37, 0, 13, 17, 
	17, 13, 0, 0, 0, 13, 0, 0, 
	0, 0, 0, 0, 17, 17, 0, 0, 
	0, 0, 0, 17, 17, 0, 0, 0, 
	40, 43, 43, 127, 149, 110, 15, 110, 
	40, 110, 110, 110, 15, 17, 17, 64, 
	0, 0, 40, 46, 43, 127, 149, 110, 
	15, 110, 40, 110, 110, 110, 15, 40, 
	43, 127, 149, 110, 15, 110, 40, 110, 
	110, 110, 15, 17, 64, 0, 0, 43, 
	15, 15, 7, 70, 74, 0, 0, 7, 
	0, 0, 0, 27, 31, 1, 1, 1, 
	1, 1, 1, 27, 3, 0, 0, 0, 
	0, 0, 0, 27, 34, 34, 5, 5, 
	34, 5, 5, 5, 5, 27, 0, 0, 
	0, 27, 7, 7, 0, 0, 7, 0, 
	0, 0, 0, 27, 0, 67, 23, 0, 
	31, 1, 1, 1, 1, 1, 25, 52, 
	49, 17, 0, 0, 17, 0, 0, 17, 
	17, 0, 0, 17, 17, 0, 0, 17, 
	0, 0, 17, 0, 0, 55, 27, 58, 
	58, 29, 29, 29, 29, 29, 61, 61, 
	61, 29, 61, 61, 29, 29, 29, 61, 
	61, 29, 29, 61, 29, 29, 61, 29, 
	29, 29, 29, 29, 61, 61, 29, 29, 
	29, 61, 61, 61, 61, 61, 29, 58, 
	27, 27, 27, 27, 27, 25, 52, 49, 
	52, 49, 52, 49, 52, 49, 55, 0
]

class << self
	attr_accessor :_parser_to_state_actions
	private :_parser_to_state_actions, :_parser_to_state_actions=
end
self._parser_to_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	19, 19, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_parser_from_state_actions
	private :_parser_from_state_actions, :_parser_from_state_actions=
end
self._parser_from_state_actions = [
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0, 0, 0, 0, 0, 
	0, 21, 0, 0, 0, 0, 0, 0, 
	0, 0, 0, 0
]

class << self
	attr_accessor :_parser_eof_trans
	private :_parser_eof_trans, :_parser_eof_trans=
end
self._parser_eof_trans = [
	0, 445, 440, 440, 439, 439, 439, 439, 
	439, 438, 438, 438, 439, 438, 438, 439, 
	439, 439, 438, 438, 439, 439, 438, 439, 
	439, 438, 439, 439, 439, 439, 439, 438, 
	438, 439, 439, 439, 438, 438, 438, 438, 
	438, 439, 440, 445, 445, 445, 445, 445, 
	0, 0, 446, 453, 454, 453, 454, 453, 
	454, 453, 454, 455
]

class << self
	attr_accessor :parser_start
end
self.parser_start = 49;
class << self
	attr_accessor :parser_first_final
end
self.parser_first_final = 49;
class << self
	attr_accessor :parser_error
end
self.parser_error = 0;

class << self
	attr_accessor :parser_en_Closeout
end
self.parser_en_Closeout = 48;
class << self
	attr_accessor :parser_en_main
end
self.parser_en_main = 49;

# line 105 "scan.rl"
      
# line 373 "scan.rb"
begin
	p ||= 0
	pe ||= data.length
	cs = parser_start
	ts = nil
	te = nil
	act = 0
end
# line 106 "scan.rl"
      
# line 384 "scan.rb"
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
	_acts = _parser_from_state_actions[cs]
	_nacts = _parser_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _parser_actions[_acts - 1]
			when 19 then
# line 1 "scan.rl"
		begin
ts = p
		end
# line 1 "scan.rl"
# line 419 "scan.rb"
		end # from state action switch
	end
	if _trigger_goto
		next
	end
	_keys = _parser_key_offsets[cs]
	_trans = _parser_index_offsets[cs]
	_klen = _parser_single_lengths[cs]
	_break_match = false
	
	begin
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + _klen - 1

	     loop do
	        break if _upper < _lower
	        _mid = _lower + ( (_upper - _lower) >> 1 )

	        if data[p] < _parser_trans_keys[_mid]
	           _upper = _mid - 1
	        elsif data[p] > _parser_trans_keys[_mid]
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
	  _klen = _parser_range_lengths[cs]
	  if _klen > 0
	     _lower = _keys
	     _upper = _keys + (_klen << 1) - 2
	     loop do
	        break if _upper < _lower
	        _mid = _lower + (((_upper-_lower) >> 1) & ~1)
	        if data[p] < _parser_trans_keys[_mid]
	          _upper = _mid - 2
	        elsif data[p] > _parser_trans_keys[_mid+1]
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
	end
	if _goto_level <= _eof_trans
	cs = _parser_trans_targs[_trans]
	if _parser_trans_actions[_trans] != 0
		_acts = _parser_trans_actions[_trans]
		_nacts = _parser_actions[_acts]
		_acts += 1
		while _nacts > 0
			_nacts -= 1
			_acts += 1
			case _parser_actions[_acts - 1]
when 0 then
# line 5 "scan.rl"
		begin
 mark_pfx = p 		end
# line 5 "scan.rl"
when 1 then
# line 6 "scan.rl"
		begin

	  if data[mark_pfx..p-1] != @prefix
	    cs = 48;
    end
			end
# line 6 "scan.rl"
when 2 then
# line 11 "scan.rl"
		begin
 mark_stg = p 		end
# line 11 "scan.rl"
when 3 then
# line 12 "scan.rl"
		begin
 @starttag = data[mark_stg..p-1] 		end
# line 12 "scan.rl"
when 4 then
# line 13 "scan.rl"
		begin
 mark_attr = p 		end
# line 13 "scan.rl"
when 5 then
# line 14 "scan.rl"
		begin

	  @attrs[@nat] = @vat 
			end
# line 14 "scan.rl"
when 6 then
# line 23 "scan.rl"
		begin
 mark_nat = p 		end
# line 23 "scan.rl"
when 7 then
# line 24 "scan.rl"
		begin
 @nat = data[mark_nat..p-1] 		end
# line 24 "scan.rl"
when 8 then
# line 25 "scan.rl"
		begin
 mark_vat = p 		end
# line 25 "scan.rl"
when 9 then
# line 26 "scan.rl"
		begin
 @vat = data[mark_vat..p-1] 		end
# line 26 "scan.rl"
when 10 then
# line 28 "scan.rl"
		begin
 @flavor = :open 		end
# line 28 "scan.rl"
when 11 then
# line 29 "scan.rl"
		begin
 @flavor = :self 		end
# line 29 "scan.rl"
when 12 then
# line 30 "scan.rl"
		begin
 @flavor = :close 		end
# line 30 "scan.rl"
when 13 then
# line 56 "scan.rl"
		begin
$stderr.puts "left attrs #{@attrs.inspect}"		end
# line 56 "scan.rl"
when 14 then
# line 58 "scan.rl"
		begin
$stderr.puts "checking close"		end
# line 58 "scan.rl"
when 15 then
# line 59 "scan.rl"
		begin
$stderr.puts "checking open"		end
# line 59 "scan.rl"
when 16 then
# line 62 "scan.rl"
		begin
$stderr.puts "looking for trailer #{data[p..p+2]}"		end
# line 62 "scan.rl"
when 17 then
# line 63 "scan.rl"
		begin
$stderr.puts "couldn't find trailer #{data[p-2..p+2]}"		end
# line 63 "scan.rl"
when 20 then
# line 1 "scan.rl"
		begin
te = p+1
		end
# line 1 "scan.rl"
when 21 then
# line 71 "scan.rl"
		begin
act = 1;		end
# line 71 "scan.rl"
when 22 then
# line 80 "scan.rl"
		begin
act = 2;		end
# line 80 "scan.rl"
when 23 then
# line 80 "scan.rl"
		begin
te = p+1
 begin 
	    @nodes.last << data[p]
	    @tagstart = p
	   end
		end
# line 80 "scan.rl"
when 24 then
# line 71 "scan.rl"
		begin
te = p
p = p - 1; begin 
	    puts "ate tag #{data[@tagstart..p]}"
	    tag = {:prefix=>@prefix, :name=>@starttag, :flavor => @flavor, :attrs => @attrs}
	    @prefix = nil
	    @name = nil
	    @flavor = :tasteless
	    @attrs = {}
	    @nodes << tag << ''
	   end
		end
# line 71 "scan.rl"
when 25 then
# line 80 "scan.rl"
		begin
te = p
p = p - 1; begin 
	    @nodes.last << data[p]
	    @tagstart = p
	   end
		end
# line 80 "scan.rl"
when 26 then
# line 80 "scan.rl"
		begin
 begin p = ((te))-1; end
 begin 
	    @nodes.last << data[p]
	    @tagstart = p
	   end
		end
# line 80 "scan.rl"
when 27 then
# line 1 "scan.rl"
		begin
	case act
	when 1 then
	begin begin p = ((te))-1; end

	    puts "ate tag #{data[@tagstart..p]}"
	    tag = {:prefix=>@prefix, :name=>@starttag, :flavor => @flavor, :attrs => @attrs}
	    @prefix = nil
	    @name = nil
	    @flavor = :tasteless
	    @attrs = {}
	    @nodes << tag << ''
	  end
	when 2 then
	begin begin p = ((te))-1; end

	    @nodes.last << data[p]
	    @tagstart = p
	  end
end 
			end
# line 1 "scan.rl"
# line 666 "scan.rb"
			end # action switch
		end
	end
	if _trigger_goto
		next
	end
	end
	if _goto_level <= _again
	_acts = _parser_to_state_actions[cs]
	_nacts = _parser_actions[_acts]
	_acts += 1
	while _nacts > 0
		_nacts -= 1
		_acts += 1
		case _parser_actions[_acts - 1]
when 18 then
# line 1 "scan.rl"
		begin
ts = nil;		end
# line 1 "scan.rl"
# line 687 "scan.rb"
		end # to state action switch
	end
	if _trigger_goto
		next
	end
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
	if _parser_eof_trans[cs] > 0
		_trans = _parser_eof_trans[cs] - 1;
		_goto_level = _eof_trans
		next;
	end
end
	end
	if _goto_level <= _out
		break
	end
	end
	end
# line 107 "scan.rl"
      return @nodes
    end
  end
end