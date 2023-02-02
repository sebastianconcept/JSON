Class {
	#name : #JsonObject,
	#superclass : #Dictionary,
	#category : #JSON
}

{ #category : #'as yet unclassified' }
JsonObject class >> fromAssociations: collectionOfAssociations [

	| result |
	result := self new.
	
	collectionOfAssociations do: [:each |
		result at: each key put: each value ].
	^ result
]

{ #category : #comparing }
JsonObject >> addJsonDifferencesWith: aJsonObject to: anOrderedCollection [
	aJsonObject species = self species
		ifTrue: [ 
			self keys sort = aJsonObject keys sort
				ifTrue: [ self addValueDifferencesWith: aJsonObject to: anOrderedCollection ]
				ifFalse: [ 
					anOrderedCollection
						add:
							'Keys are different: ' , (self keys difference: aJsonObject keys) asCommaString , ' actual:'
								, self keys sort greaseString , ' expected: ' , aJsonObject keys sort greaseString ] ]
		ifFalse: [ 
			aJsonObject isArray
				ifTrue: [ anOrderedCollection add: 'Expected JSONObject but got Array ', aJsonObject greaseString ]
				ifFalse: [ anOrderedCollection add: 'Expected JSONObject but got String ' , aJsonObject ] ]
]

{ #category : #comparing }
JsonObject >> addValueDifferencesWith: aJsonObject to: anOrderedCollection [
	self
		keysAndValuesDo: [ :key :val | 
			| otherVal |
			otherVal := aJsonObject at: key.
			val = otherVal
				ifFalse: [ val addJsonDifferencesWith: otherVal to: anOrderedCollection ] ]
]

{ #category : #converting }
JsonObject >> asJsonObject [
	^ self
]

{ #category : #accessing }
JsonObject >> at: aKey [

	"make it work more like javascript objects"
	^ self at: aKey ifAbsent: [nil]
]

{ #category : #reflection }
JsonObject >> doesNotUnderstand: aMessage [
	| key |
	key := aMessage selector.
	key isUnary ifTrue: [^ self at: key ifAbsent: [nil]].
	^ (key isKeyword and: [(key occurrencesOf: $:) = 1])
		ifTrue: [key := key allButLast asSymbol.
				self at: key put: aMessage arguments first]
		ifFalse: [super doesNotUnderstand: aMessage]
				
	
]

{ #category : #comparing }
JsonObject >> jsonDifferencesWith: aJsonObject [
	| diffs |
	diffs := OrderedCollection new.
	self addJsonDifferencesWith: aJsonObject to: diffs.
	^ diffs
]

{ #category : #accessing }
JsonObject >> name [
"override 'cause Object defines this"
	^self at: 'name'
]

{ #category : #accessing }
JsonObject >> value [
"override 'cause Object defines this"
	^self at: 'value'
]
