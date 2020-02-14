Class {
	#name : #JsonDummyTestObject,
	#superclass : #Object,
	#instVars : [
		'a',
		'b',
		'c'
	],
	#category : #JSON
}

{ #category : #'as yet unclassified' }
JsonDummyTestObject class >> constructFromJson: j [
	^ self new a: (j at: 'a'); b: (j at: 'b'); c: (j at: 'c'); yourself
]

{ #category : #'as yet unclassified' }
JsonDummyTestObject >> = other [
	^ other class == self class and: [
		a = other a and: [
		b = other b and: [
		c = other c]]]
]

{ #category : #accessing }
JsonDummyTestObject >> a [
	"Answer the value of a"

	^ a
]

{ #category : #accessing }
JsonDummyTestObject >> a: anObject [
	"Set the value of a"

	a := anObject
]

{ #category : #accessing }
JsonDummyTestObject >> b [
	"Answer the value of b"

	^ b
]

{ #category : #accessing }
JsonDummyTestObject >> b: anObject [
	"Set the value of b"

	b := anObject
]

{ #category : #accessing }
JsonDummyTestObject >> c [
	"Answer the value of c"

	^ c
]

{ #category : #accessing }
JsonDummyTestObject >> c: anObject [
	"Set the value of c"

	c := anObject
]

{ #category : #'as yet unclassified' }
JsonDummyTestObject >> jsonWriteOn: s [
	Json renderInstanceVariables: {#a. #b. #c} of: self on: s

]
