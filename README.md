## twitter-korean-text-ruby
[![Build Status](https://travis-ci.org/keepcosmos/twitter-korean-text-ruby.svg?branch=master)](https://travis-ci.org/keepcosmos/twitter-korean-text-ruby)
[![Code Climate](https://codeclimate.com/repos/56d562f8e4ecf4707f00309b/badges/7673319c6a92ab7ace9f/gpa.svg)](https://codeclimate.com/repos/56d562f8e4ecf4707f00309b/feed)
[![Gem Version](https://badge.fury.io/rb/twitter-korean-text-ruby.svg)](https://badge.fury.io/rb/twitter-korean-text-ruby)

Ruby interface to [twitter-korean-text](https://github.com/twitter/twitter-korean-text) by Twitter

트위터에서 제공하는 한글 형태소 분석기인 [twitter-korean-text](https://github.com/twitter/twitter-korean-text)(Scala)를 Ruby에서 사용가능하도록 Wrapping 하였습니다.

### install
```{ruby}
$ gem install twitter-korean-text-ruby
```
Gemfile을 사용할 경우
```{ruby}
# Gemfile
gem 'twitter-korean-text-ruby'
```

### Useage
```ruby
require 'twitter-korean-text-ruby'

processor = TwitterKorean::Processor.new
# OR with JVM arguments
processor = TwitterKorean::Processor.new('-Xms126M', '-Xms512M', ...)

# Normalize
processor.normalize("형태소 분석을 합니닼ㅋㅋㅋㅋㅋㅋ")
# => "형태소 분석을 합니다ㅋㅋㅋㅋㅋㅋ"

# Tokenize
tokens = proccessor.tokenize("한국어를 처리하는 예시입니다 ㅋㅋ")
puts tokens
# => ["한국어", "를", " ", "처리", "하는", " ", "예시", "입니", "다", " ", "ㅋㅋ"]

# metadata of token, 토큰에 대한 정보
metadata = tokens.first.metadata
matadata #=> "noun, 0, 3"
metadata.pos #=> :noun
metadata.offset #=> 0
metadata.length #=> 3

# Stemming
tokens = proccessor.stem("한국어를 처리하는 예시입니다 ㅋㅋ")
puts tokens
# => ["한국어", "를", " ", "처리", "하다", " ", "예시", "이다", " ", "ㅋㅋ"]

# extract phrases
tokens = proccessor.stem("한국어를 처리하는 예시입니다 ㅋㅋ")
puts tokens
# => ["한국어", "처리", "처리하는 예시", "예시"]

```

### Test
```{ruby}
rake test
```

### Issue
JAVA Path를 찾지 못했을 경우, 
```{bash}
export JAVA_HOME=$(java_home_path)

### Contribute
이 프로젝트는 [twitter-korean-text](https://github.com/twitter/twitter-korean-text) 프로젝트의 Scala 코드를 Ruby로 Wrapping하는 프로젝트입니다.
관련된 범주에 대한 Issue와 Pull Request(테스트 코드가 포함된)는 언제나 환영입니다.
```
