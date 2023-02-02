"
I'm like JsonObject but I preserve order
"
Class {
	#name : #OrderedJsonObject,
	#superclass : #OrderedDictionary,
	#category : #JSON
}

{ #category : #'instance creation' }
OrderedJsonObject class >> fromAssociations: collectionOfAssociations [

	| result |
	result := self new.
	
	collectionOfAssociations do: [:each |
		result at: each key put: each value ].
	^ result
]

{ #category : #actions }
OrderedJsonObject >> asJsonObject [
	^ self
]

{ #category : #accessing }
OrderedJsonObject >> at: aKey [

	"make it work more like javascript objects"
	^ self at: aKey ifAbsent: [nil]
]

{ #category : #actions }
OrderedJsonObject >> doesNotUnderstand: aMessage [
	| key |
	key := aMessage selector.
	key isUnary ifTrue: [^ self at: key ifAbsent: [nil]].
	^ (key isKeyword and: [(key occurrencesOf: $:) = 1])
		ifTrue: [key := key allButLast asSymbol.
				self at: key put: aMessage arguments first]
		ifFalse: [super doesNotUnderstand: aMessage]
				
	
]

{ #category : #actions }
OrderedJsonObject >> jsonWriteOn: aStream [
	
	| lastOne |
	
	aStream nextPut: ${.
	
	self associations notEmpty ifTrue: [ 
		lastOne := self associations last ].
	
	self associationsDo: [:each |
		each jsonWriteOn: aStream.
		each ~= lastOne ifTrue: [ aStream nextPut: $, ]].

	aStream nextPut: $}
]

{ #category : #accessing }
OrderedJsonObject >> name [
"override 'cause Object defines this"
	^self at: 'name'
]

{ #category : #accessing }
OrderedJsonObject >> value [
"override 'cause Object defines this"
	^self at: 'value'
]
