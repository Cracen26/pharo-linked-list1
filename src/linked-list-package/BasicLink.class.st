Class {
	#name : #BasicLink,
	#superclass : #Object,
	#instVars : [
		'value',
		'nextLink'
	],
	#category : #'linked-list-package'
}

{ #category : #'as yet unclassified' }
BasicLink >> nextlink [
    ^nextLink
]

{ #category : #'as yet unclassified' }
BasicLink >> nextlink: newLink [
    nextLink := newLink
]

{ #category : #accessing }
BasicLink >> value [ 
    ^value
]

{ #category : #accessing }
BasicLink >> value: newValue [
    value := newValue
]
