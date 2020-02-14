Extension { #name : #False }

{ #category : #'*JSON-writing' }
False >> jsonWriteOn: aStream [
	aStream nextPutAll: 'false'
]
