Extension { #name : #Date }

{ #category : #'*JSON' }
Date >> jsonWriteOn: aStream [

	aStream 
		nextPut: $";
		nextPutAll: self yyyymmdd asString;
		nextPut: $"
]
