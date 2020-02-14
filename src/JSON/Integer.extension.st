Extension { #name : #Integer }

{ #category : #'*JSON-writing' }
Integer >> jsonWriteOn: aWriteStream [
	^ self printOn: aWriteStream base: 10

]
