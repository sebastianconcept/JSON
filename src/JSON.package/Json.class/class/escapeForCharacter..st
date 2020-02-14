as yet unclassified
escapeForCharacter: c
	
	| asciiValue |
	(asciiValue := c asciiValue) < 128
		ifTrue: [ ^escapeArray at: asciiValue + 1 ].
	^nil