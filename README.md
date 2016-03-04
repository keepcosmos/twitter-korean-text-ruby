## twitter-korean-text-ruby
[![Build Status](https://travis-ci.org/keepcosmos/twitter-korean-text-ruby.svg?branch=master)](https://travis-ci.org/keepcosmos/twitter-korean-text-ruby)
[![Code Climate](https://codeclimate.com/repos/56d562f8e4ecf4707f00309b/badges/7673319c6a92ab7ace9f/gpa.svg)](https://codeclimate.com/repos/56d562f8e4ecf4707f00309b/feed)
[![Gem Version](https://badge.fury.io/rb/twitter-korean-text-ruby.svg)](https://badge.fury.io/rb/twitter-korean-text-ruby)

Ruby interface to [twitter-korean-text](https://github.com/twitter/twitter-korean-text) by Twitter

트위터에서 제공하는 한글 형태소 분석기인 [twitter-korean-text](https://github.com/twitter/twitter-korean-text)(Scala)를 Ruby에서 사용가능하도록 Wrapping 하였습니다.

[twitter-korean-text 4.4](https://github.com/twitter/twitter-korean-text/releases/tag/korean-text-4.4) 버젼을 바탕으로 만들어졌습니다.

### Install
```{ruby}
$ gem install twitter-korean-text-ruby
```
Gemfile을 사용할 경우
```{ruby}
# Gemfile
gem 'twitter-korean-text-ruby'
```

### Useage
#### Basic
```ruby
require 'twitter-korean-text-ruby'

processor = TwitterKorean::Processor.new
# OR with JVM arguments
processor = TwitterKorean::Processor.new('-Xms126M', '-Xmx512M', ...)

# Normalize
processor.normalize("형태소 분석을 합니닼ㅋㅋㅋㅋㅋㅋ")
# => "형태소 분석을 합니다ㅋㅋㅋㅋㅋㅋ"

# Tokenize
proccessor.tokenize("한국어를 처리하는 예시입니다 ㅋㅋ")
# => ["한국어", "를", " ", "처리", "하는", " ", "예시", "입니", "다", " ", "ㅋㅋ"]

# Stemming
proccessor.stem("한국어를 처리하는 예시입니다 ㅋㅋ")
# => ["한국어", "를", " ", "처리", "하다", " ", "예시", "이다", " ", "ㅋㅋ"]

# extract phrases
proccessor.stem("한국어를 처리하는 예시입니다 ㅋㅋ")
# => ["한국어", "처리", "처리하는 예시", "예시"]
```
#### Token Information
토큰 클래스(`TwitterKorean::KoreanToken`)는 String을 상속받아 만들었습니다. 토큰에 대한 메타정보는 `metadata` attribute를 사용합니다.

```{ruby}
tokens = proccessor.tokenize("한국어를 처리하는 예시입니다 ㅋㅋ")
token = tokens.first

token #=> 한국어
metadata = token.metadata
matadata #=> "noun, 0, 3"
metadata.pos #=> :noun
metadata.offset #=> 0
metadata.length #=> 3
```

### Test
```{ruby}
rake test
```

### Issue
JAVA_HOME Path를 찾지 못했을 경우, 
```{bash}
export JAVA_HOME=$(java_home_path)
```

### Contribute
이 프로젝트는 [twitter-korean-text](https://github.com/twitter/twitter-korean-text) 프로젝트의 Scala 코드를 Ruby로 Wrapping하는 프로젝트입니다.
관련된 범주에 대한 Issue와 Pull Request(테스트 코드가 포함된)는 언제나 환영입니다.

