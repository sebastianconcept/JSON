Extension { #name : #Text }

{ #category : #'*json-printing' }
Text >> jsonWriteOn: aStream [
	self string jsonWriteOn: aStream
]
