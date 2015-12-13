require 'natto'
require 'csv'

class UserCsv
  class << self
    def add(name)
      CSV.open("localwiki.csv", "a:UTF-8") do |csv|
        return if name =~ %r(^[+-.$()?*/&%!"'_,]+)
        return if name =~ /^[-.0-9]+$/
        name_length = name.length
        score = [-36000.0, -400 * (name_length ** 1.5)].max.to_i
        csv << [name, nil, nil, score, '名詞', '一般', '*', '*', '*', '*', name, '*', '*']
      end
    end
  end
end
