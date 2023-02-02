"
I provide a number of test cases for class Json.
"
Class {
	#name : #JsonTests,
	#superclass : #TestCase,
	#category : #JSON
}

{ #category : #asserting }
JsonTests >> json: aString equals: aValue [
	| readValue |
	readValue := self readFrom: aString.
	self assert: readValue = aValue.
]

{ #category : #'instance creation' }
JsonTests >> readFrom: aString [
	^ (Json newWithConstructors: {JsonDummyTestObject.}) readFrom: aString readStream

]

{ #category : #'instance creation' }
JsonTests >> render: anObject equals: aString [
	self assert: (Json render: anObject) = aString
]

{ #category : #'instance creation' }
JsonTests >> simpleDummyObject [
	^ JsonDummyTestObject new a: 1; b: 2; c: 3; yourself
]

{ #category : #testing }
JsonTests >> testArray [
	self json: '[]' equals: #().
	self json: '[[]]' equals: #(#()).
	self json: '[[], []]' equals: #(#() #()).
	self json: '["hi", "there"]' equals: #('hi' 'there').
	self json: '[["a", "b", null]]' equals: #(('a' 'b' nil)).
]

{ #category : #testing }
JsonTests >> testAtomFalse [
	self json: 'false' equals: false.
	self json: '  false' equals: false.
	self json: 'false  ' equals: false.
	self json: '  false  ' equals: false.

]

{ #category : #testing }
JsonTests >> testAtomNull [
	self json: 'null' equals: nil.
	self json: '  null' equals: nil.
	self json: 'null  ' equals: nil.
	self json: '  null  ' equals: nil.

]

{ #category : #testing }
JsonTests >> testAtomNumber [
	self json: '1' equals: 1.
	self json: '0123' equals: 123.
	self json: '1.23e2' equals: 123.
	self json: '-1' equals: -1.
	self json: '-0' equals: 0.
	self json: '[-1.2]' equals: #(-1.2).
]

{ #category : #testing }
JsonTests >> testAtomString [
	self json: '"hi"' equals: 'hi'.
	self json: '"\""' equals: '"'.
	self json: '"\\"' equals: '\'.
	self json: '""' equals: ''.
	self json: '"a\u0004b"' equals: ({$a. Character value: 4. $b} as: String).
	self json: '"a\nb"' equals: ({$a. Character lf. $b} as: String).
]

{ #category : #testing }
JsonTests >> testAtomTrue [
	self json: 'true' equals: true.
	self json: '  true' equals: true.
	self json: 'true  ' equals: true.
	self json: '  true  ' equals: true.

]

{ #category : #testing }
JsonTests >> testCtor [
	self json: '@JsonDummyTestObject {"a": 1, "b": 2, "c": 3}' equals: self simpleDummyObject.
	self json: (Json render: self simpleDummyObject) equals: self simpleDummyObject.
]

{ #category : #testing }
JsonTests >> testDictionary [
	self json: '{}' equals: (JsonObject new).
	self json: '{"a": "a"}' equals: (JsonObject new at: 'a' put: 'a'; yourself).
	self json: '{"a": [[]]}' equals: (JsonObject new at: 'a' put: #(#()); yourself).
	self json: '{"a":"b", "b":"a"}' equals: (JsonObject new add: 'a'->'b'; add: 'b'->'a';yourself).
]

{ #category : #testing }
JsonTests >> testMissingCtor [
	self 
		should: [self readFrom: '@Missing[]']
		raise: JsonSyntaxError

]

{ #category : #testing }
JsonTests >> testMissingCtorNoMap [
	self 
		should: [Json new readFrom: '@Missing[]' readStream]
		raise: JsonSyntaxError
]

{ #category : #testing }
JsonTests >> testStringWithUnicode [

	| unicodeString |
	unicodeString := (Unicode value: 16r263A) asString.
	self json: '"\u263A"' equals:unicodeString.
	self json: '"', unicodeString, '"' equals: unicodeString.
	self render: unicodeString equals: '"', unicodeString, '"'.
]

{ #category : #testing }
JsonTests >> testWriteAssociation [
	self render: 'key' -> 'value' equals: '"key": "value"'.
	self render: 'key' -> 2 equals: '"key": 2'.
	"keys should be strings"
	self render: 42 -> 2 equals: '"42": 2'.
	"try to do _something_ for more complex keys"
	self render: #(42 43 44) -> 2 equals:  '"#(42 43 44)": 2'.
	
	
	
]

{ #category : #testing }
JsonTests >> testWriteString [
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} as: String) equals: '"a\nb"'.
	self render: ({$a. Character value: 4. $b} as: String) equals: '"a\u0004b"'.
]
