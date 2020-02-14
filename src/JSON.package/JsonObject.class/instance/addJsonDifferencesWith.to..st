comparing
addJsonDifferencesWith: aJsonObject to: anOrderedCollection
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