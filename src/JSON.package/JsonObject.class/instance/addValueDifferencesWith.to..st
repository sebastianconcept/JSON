comparing
addValueDifferencesWith: aJsonObject to: anOrderedCollection
	self
		keysAndValuesDo: [ :key :val | 
			| otherVal |
			otherVal := aJsonObject at: key.
			val = otherVal
				ifFalse: [ val addJsonDifferencesWith: otherVal to: anOrderedCollection ] ]