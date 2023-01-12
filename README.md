# JSON
JSON abstraction for Pharo Smalltalk


![build](https://github.com/sebastianconcept/JSON/actions/workflows/build.yml/badge.svg)
[![Release](https://img.shields.io/github/v/tag/sebastianconcept/JSON?label=release)](https://github.com/sebastianconcept/JSON/releases)
[![License](https://img.shields.io/badge/license-MIT-green)](./LICENSE.txt)

This is a port from older `smalltalkhub.com/PharoExtras/JSON` 


## Load from Playground
```smalltalk
Metacello new
  baseline:'JSON';
  repository: 'github://sebastianconcept/JSON/src';
  load.
```

## Load as dependency
```smalltalk
spec
  baseline: 'JSON'
  with: [ spec
    loads: #('JSON');
    repository: 'github://sebastianconcept/JSON/src' ]
```
        