*JSON-writing
jsonWriteOn: aStream

	aStream nextPut: $".
	self do: [ :ch |
		(Json escapeForCharacter: ch)
			ifNil: [ aStream nextPut: ch ]
			ifNotNil: [ :replacement |
				aStream nextPutAll: replacement ] ].
	aStream nextPut: $".
