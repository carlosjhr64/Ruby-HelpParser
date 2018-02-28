module HelpParser
  @@validate = true # false TODO revert
  def self.validate!
    @@validate = true
  end
  def self.validate?
    @@validate
  end

  USAGE = 'usage'
  TYPES = 'types'
  EXCLUSIVE = 'exclusive'

  # usage
  FLAG       = /^[-][-]?(?<k>\w+)$/
  LITERAL    = /^(?<k>\w[\w.-]*:?)$/
  VARIABLE   = /^<(?<k>\w+)(=(?<t>[A-Z]+))?>(?<p>[+])?$/
  FLAG_GROUP = /^:(?<k>\w+)(?<p>[+])?$/

  # spec --?w+
  SHORT = /^[-](?<s>\w)$/
  LONG  = /^[-][-](?<k>\w+)(=(?<t>[A-Z]+))?(,?\s+(?<d>[^-\s]\S*))?$/

  # spec -w,? --w+
  SHORT_LONG         = /^[-](?<s>\w),?\s+[-][-](?<k>\w+)$/
  SHORT_LONG_DEFAULT = /^[-](?<s>\w),?\s+[-][-](?<k>\w+)(=(?<t>[A-Z]+))?,?\s+(?<d>[^-\s]\S*)$/

  # spec W+ /~/
  TYPE_DEF = /^(?<t>[A-Z]+),?\s+\/(?<r>\S+)\/$/

  # spec w+( w+)+
  X_DEF = /^\w+( +\w+)+$/

  CSV = /,?\s+/

  # exit codes
  EX_USAGE    = 64
  EX_SOFTWARE = 70
  EX_CONFIG   = 78

  # error messages, partials:
  NO_MATCH            = 'Software Error: NoMatch was not caught by HelpParser.'
  DUP_KEY             = 'Duplicate key'
  DUP_WORD            = 'Duplicate word'
  DUP_FLAG            = 'Duplicate flag'
  DUP_X               = 'Duplicate exclusive spec'
  UNSEEN_FLAG         = 'Undefined flag'
  INCONSISTENT        = 'Inconsistent use of variable'
  UNEXPECTED          = 'Unexpected string in help text'
  BAD_REGEX           = 'Bad regex'
  REDUNDANT           = 'Redundant'
  EXCLUSIVE_KEYS      = 'Exclusive keys'
  UNBALANCED          = 'Unbalanced brackets'
  UNRECOGNIZED_TOKEN  = 'Unrecognized usage token'
  UNRECOGNIZED_TYPE   = 'Unrecognized type spec'
  UNRECOGNIZED_X      = 'Unrecognized exclusive spec'
  UNRECOGNIZED_OPTION = 'Unrecognized option spec'
  UNDEFINED_SECTION   = 'Section not defined'
  MISSING_CASES       = 'Missing cases'
  MISSING_USAGE       = 'Missing usage'
  UNCOMPLETED_TYPES   = 'Uncompleted types definition'
  BAD_DEFAULT         = 'Default does not match type'
  NOT_STRING          = 'Not a String'
  NOT_STRINGS         = 'Not all Strings'
  NOT_FLOAT           = 'Not a Float'
  NOT_FLOATS          = 'Not all Floats'
  NOT_INTEGER         = 'Not an Integer'
  NOT_INTEGERS        = 'Not all Integers'
  # error messages, full:
  MATCH_USAGE         = 'Please match usage.'
  EXTRANEOUS_SPACES   = 'Extraneous spaces in help.'

  # lambda utilities
  MSG = lambda{|msg,*keys| "\033[0;31m#{msg}:  #{keys.join(' ')}\033[0m"}
  F2K = lambda{|f| f[1]=='-' ? f[2..((f.index('=')||0)-1)] : f[1]}
  RESERVED = lambda{|k| [USAGE,TYPES,EXCLUSIVE].include?(k)} # reserved
end
