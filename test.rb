# def params_to_string(params)
# end
# params= {name: 'Ricky', hobby: 'computer'}
# params_to_string(params)

require 'active_support/core_ext/string'
require 'uri'

def param_sign_auto(params)
  params.collect(&:camelize)
  # return_str = ''
  # params.each { |k, v| return_str << "#{k.to_s.split('_').collect(&:capitalize).join}=#{v}&" }
  # return_str.split.join(' ').chop
end

def params_to_hash(params)
  new_hash = {}
  params.collect do |param|
    new_hash[param] = 'a'
  end
end

# 针对param_sign hash的键大写，里面的参数小写
def self.params_sign_to_hash(params, target_params)
  hash = {}
  target_params.collect do |k|
    k1 = k.camelize
    hash.merge!("#{k1}": params[k.to_sym])
  end
  hash
end

def stringify_keys(hash)
  new_hash = {}
  hash.each do |key, value|
    new_hash[(key.to_s rescue key) || key] = value.to_s
  end
  p new_hash
end


NOTIFY_SIGN_FIELD = %w(version merchant_id)
test = { version: nil, merchant_id: 'hehe' }
sign_params = params_sign_to_hash(test, NOTIFY_SIGN_FIELD)
print sign_params
p URI.encode_www_form(stringify_keys(sign_params))

puts '----'

sign_params = param_sign_auto(NOTIFY_SIGN_FIELD)
# print sign_params
print sign_params

# hash = sign_params.collect do |param|
#   { "#{param}": 'ab' }
# end

container = {}
sign_params.collect do |k|
  container.merge!("#{k}": '123')
end
p container


p URI.encode_www_form(stringify_keys(container))



