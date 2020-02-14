Extension { #name : #WriteStream }

{ #category : #'*json-printing' }
WriteStream >> jsonPrint: anObject [
	anObject jsonWriteOn: self
]
