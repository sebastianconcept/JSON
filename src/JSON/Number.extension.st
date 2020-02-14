Extension { #name : #Number }

{ #category : #'*JSON-writing' }
Number >> jsonWriteOn: aWriteStream [ 

	self printOn: aWriteStream base: 10
]
