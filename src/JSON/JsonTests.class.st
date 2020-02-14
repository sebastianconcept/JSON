"
I provide a number of test cases for class Json.
"
Class {
	#name : #JsonTests,
	#superclass : #TestCase,
	#category : #JSON
}

{ #category : #'as yet unclassified' }
JsonTests >> json: aString equals: aValue [
	| readValue |
	readValue := self readFrom: aString.
	self assert: readValue = aValue.
]

{ #category : #'as yet unclassified' }
JsonTests >> readFrom: aString [
	^ (Json newWithConstructors: {JsonDummyTestObject.}) readFrom: aString readStream

]

{ #category : #'as yet unclassified' }
JsonTests >> render: anObject equals: aString [
	self assert: (Json render: anObject) = aString
]

{ #category : #'as yet unclassified' }
JsonTests >> simpleDummyObject [
	^ JsonDummyTestObject new a: 1; b: 2; c: 3; yourself
]

{ #category : #'as yet unclassified' }
JsonTests >> testArray [
	self json: '[]' equals: #().
	self json: '[[]]' equals: #(#()).
	self json: '[[], []]' equals: #(#() #()).
	self json: '["hi", "there"]' equals: #('hi' 'there').
	self json: '[["a", "b", null]]' equals: #(('a' 'b' nil)).
]

{ #category : #'as yet unclassified' }
JsonTests >> testAtomFalse [
	self json: 'false' equals: false.
	self json: '  false' equals: false.
	self json: 'false  ' equals: false.
	self json: '  false  ' equals: false.

]

{ #category : #'as yet unclassified' }
JsonTests >> testAtomNull [
	self json: 'null' equals: nil.
	self json: '  null' equals: nil.
	self json: 'null  ' equals: nil.
	self json: '  null  ' equals: nil.

]

{ #category : #'as yet unclassified' }
JsonTests >> testAtomNumber [
	self json: '1' equals: 1.
	self json: '0123' equals: 123.
	self json: '1.23e2' equals: 123.
	self json: '-1' equals: -1.
	self json: '-0' equals: 0.
	self json: '[-1.2]' equals: #(-1.2).
]

{ #category : #'as yet unclassified' }
JsonTests >> testAtomString [
	self json: '"hi"' equals: 'hi'.
	self json: '"\""' equals: '"'.
	self json: '"\\"' equals: '\'.
	self json: '""' equals: ''.
	self json: '"a\u0004b"' equals: ({$a. Character value: 4. $b} as: String).
	self json: '"a\nb"' equals: ({$a. Character lf. $b} as: String).
]

{ #category : #'as yet unclassified' }
JsonTests >> testAtomTrue [
	self json: 'true' equals: true.
	self json: '  true' equals: true.
	self json: 'true  ' equals: true.
	self json: '  true  ' equals: true.

]

{ #category : #'as yet unclassified' }
JsonTests >> testCtor [
	self json: '@JsonDummyTestObject {"a": 1, "b": 2, "c": 3}' equals: self simpleDummyObject.
	self json: (Json render: self simpleDummyObject) equals: self simpleDummyObject.
]

{ #category : #'as yet unclassified' }
JsonTests >> testDictionary [
	self json: '{}' equals: (JsonObject new).
	self json: '{"a": "a"}' equals: (JsonObject new at: 'a' put: 'a'; yourself).
	self json: '{"a": [[]]}' equals: (JsonObject new at: 'a' put: #(#()); yourself).
	self json: '{"a":"b", "b":"a"}' equals: (JsonObject new add: 'a'->'b'; add: 'b'->'a';yourself).
]

{ #category : #'as yet unclassified' }
JsonTests >> testMissingCtor [
	self 
		should: [self readFrom: '@Missing[]']
		raise: JsonSyntaxError

]

{ #category : #'as yet unclassified' }
JsonTests >> testMissingCtorNoMap [
	self 
		should: [Json new readFrom: '@Missing[]' readStream]
		raise: JsonSyntaxError
]

{ #category : #'as yet unclassified' }
JsonTests >> testStringWithUnicode [

	| unicodeString |
	unicodeString := (Unicode value: 16r263A) asString.
	self json: '"\u263A"' equals:unicodeString.
	self json: '"', unicodeString, '"' equals: unicodeString.
	self render: unicodeString equals: '"', unicodeString, '"'.
]

{ #category : #'as yet unclassified' }
JsonTests >> testWriteAssociation [
	self render: 'key' -> 'value' equals: '"key": "value"'.
	self render: 'key' -> 2 equals: '"key": 2'.
	"keys should be strings"
	self render: 42 -> 2 equals: '"42": 2'.
	"try to do _something_ for more complex keys"
	self render: #(42 43 44) -> 2 equals:  '"#(42 43 44)": 2'.
	
	
	
]

{ #category : #'as yet unclassified' }
JsonTests >> testWriteString [
	self render: '"' equals: '"\""'.
	self render: '\' equals: '"\\"'.
	self render: 'hi' equals: '"hi"'.
	self render: ({$a. Character lf. $b} as: String) equals: '"a\nb"'.
	self render: ({$a. Character value: 4. $b} as: String) equals: '"a\u0004b"'.
]
