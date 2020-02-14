comparing
jsonDifferencesWith: aJsonObject
	| diffs |
	diffs := OrderedCollection new.
	self addJsonDifferencesWith: aJsonObject to: diffs.
	^ diffs