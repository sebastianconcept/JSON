Extension { #name : #Object }

{ #category : #'*JSON' }
Object >> asJsonString [

	^ String streamContents: [:str |
		self jsonWriteOn: str ]
]
