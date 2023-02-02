Extension { #name : #DateAndTime }

{ #category : #'*JSON' }
DateAndTime >> jsonWriteOn: aStream [

	aStream 
		nextPut: $";
		nextPutAll: self asUTC printString;
		nextPut: $"
]
