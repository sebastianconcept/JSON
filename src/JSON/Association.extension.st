Extension { #name : #Association }

{ #category : #'*JSON-writing' }
Association >> jsonWriteOn: aStream [
	self key asString jsonWriteOn: aStream.
	aStream nextPut: $:; space.
	self value jsonWriteOn: aStream.
]
