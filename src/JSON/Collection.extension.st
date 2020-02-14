Extension { #name : #Collection }

{ #category : #'*json' }
Collection >> jsonWriteOn: aStream [
	"By default, use array braces "
	aStream nextPut: $[.
	
	self do: [:each |
		each jsonWriteOn: aStream
		  ] separatedBy: [ aStream nextPut: $, ].

	aStream nextPut: $]
]
