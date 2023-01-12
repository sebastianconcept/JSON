# JSON
JSON abstraction for Pharo Smalltalk

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
        