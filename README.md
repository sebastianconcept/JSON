# JSON

JSON abstraction for Pharo Smalltalk

![build](https://github.com/sebastianconcept/JSON/actions/workflows/build.yml/badge.svg)

[![Release](https://img.shields.io/github/v/tag/sebastianconcept/JSON?label=release)](https://github.com/sebastianconcept/JSON/releases)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE.txt)

[![Pharo 7](https://img.shields.io/badge/Pharo-7-%23383932.svg)](https://pharo.org/download)
[![Pharo 10](https://img.shields.io/badge/Pharo-10-%23383932.svg)](https://pharo.org/download)

This is a port from older `smalltalkhub.com/PharoExtras/JSON`

This is a comfortable way to use Smalltalk objects that your program can eventually represent as JSON.

## Example

```smalltalk
"This is how you would use a typical dictionary:"
theUniverseAndEverything := Dictionary new
	at: #theQuestion put: 'Questioner asks';
	at: #answer put: 42;
	yourself.


"JsonObject instances are like dictionaries
that use DoesNotUnderstand to set their values:"
theUniverseAndEverything := JsonObject new
	theQuestion: 'Questioner asks';
	answer: 42;
	yourself.

"And then you can:"
theUniverseAndEverything asJSONString.
'{"answer"":42,"theQuestion":"Questioner asks"}'
```

## Load from Playground

```smalltalk
Metacello new
  baseline:'JSON';
  repository: 'github://sebastianconcept/JSON:latest/src';
  load.
```

## Load as dependency

```smalltalk
spec
  baseline: 'JSON'
  with: [ spec
    loads: #('JSON');
    repository: 'github://sebastianconcept/JSON:latest/src' ]
```
