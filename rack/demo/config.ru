require './to_upper.rb'
require './wrap_with_html.rb'
require './wrap_with_red_p.rb'
require './hello.rb'

use WrapWithHtml
use WrapWithRedP
use ToUpper

run Hello.new