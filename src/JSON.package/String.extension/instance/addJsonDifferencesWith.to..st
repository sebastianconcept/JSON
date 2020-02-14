*JSON
addJsonDifferencesWith: anObject to: anOrderedCollection
	self = anObject
		ifFalse: [ 
			anObject isString
				ifTrue: [ 
					| locations |
					locations := OrderedCollection new.
					self
						doWithIndex: [ :each :index | 
							anObject size >= index
								ifTrue: [ 
									(anObject at: index) = each
										ifFalse: [ locations add: index ] ] ].
					anOrderedCollection
						add: 'string difference GOT ' , self , ' BUT EXPECTED ' , anObject , ' DIFFERENT STARTING AT POSITIONS ' , locations asCommaString, '    END.    ' ]
				ifFalse: [ anOrderedCollection add: 'expected a String but got a ' , anObject className ] ]