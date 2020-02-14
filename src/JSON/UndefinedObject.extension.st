Extension { #name : #UndefinedObject }

{ #category : #'*JSON-writing' }
UndefinedObject >> jsonWriteOn: aWriteStream [ 
	aWriteStream nextPutAll: 'null'
]
