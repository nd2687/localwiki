class UserDic
  class << self
    def execute
      # path is original of Mac
      system_command "/usr/local/Cellar/mecab/0.996/libexec/mecab/mecab-dict-index -d /usr/local/Cellar/mecab/0.996/lib/mecab/dic/ipadic -u localwiki.dic -f utf-8 -t utf-8 localwiki.csv > localwiki.log 2>&1 & echo $!"
    end

    private

    def system_command(command)
      `#{command}`
    end
  end
end
