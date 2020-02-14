Class {
	#name : #BaselineOfJSON,
	#superclass : #Object,
	#category : #JSON
}

{ #category : #baselines }
BaselineOfJSON >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'JSON' ]
]
