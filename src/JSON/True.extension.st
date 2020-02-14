Extension { #name : #True }

{ #category : #'*JSON-writing' }
True >> jsonWriteOn: aStream [
	aStream nextPutAll: 'true'
]
