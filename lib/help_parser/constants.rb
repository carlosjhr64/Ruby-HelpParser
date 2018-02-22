module HelpParser
  USAGE = 'usage'
  TYPES = 'types'

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

  CSV = /,?\s+/

  # exit codes
  EX_USAGE    = 64
  EX_SOFTWARE = 70
  EX_CONFIG   = 78

  # error messages
  MSG = lambda{|msg,*keys| "#{msg}:  #{keys.join(' ')}"}

  NO_MATCH            = 'Software Error: NoMatch was not caught by HelpParser.'
  DUP_KEY             = 'Duplicate key'
  DUP_WORD            = 'Duplicate word'
  DUP_FLAG            = 'Duplicate flag'
  INCONSISTENT        = 'Inconsistent use of variable'
  UNEXPECTED          = 'Unexpected string in help text'
  BAD_REGEX           = 'Bad regex'
  REDUNDANT           = 'Redundant'
  UNBALANCED          = 'Unbalanced brackets'
  UNRECOGNIZED_TOKEN  = 'Unrecognized usage token'
  UNRECOGNIZED_TYPE   = 'Unrecognized type spec'
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

  MATCH_USAGE         = 'Please match usage.'
  EXTRANEOUS_SPACES   = 'Extraneous spaces in help.'
end
