Class {
	#name : #AddElementTest,
	#superclass : #TestCase,
	#instVars : [
		'samplelist'
	],
	#category : #'linked-list-package-test'
}

{ #category : #running }
AddElementTest >> setUp [
   super setUp. 
   samplelist := BasicLinkedList new.
]

{ #category : #tests }
AddElementTest >> testAddElement [
   "test case to add element"
   | linkedList | 
	linkedList := BasicLinkedList new.
   linkedList addLast: 5.
   self assert: linkedList size equals: 1.
   self assert: linkedList first equals: 5. 

]

{ #category : #tests }
AddElementTest >> testAt [
	| list |
	list := BasicLinkedList  new.
	list addLast: 2.
	self assert: (list at:1) equals: 2.
]

{ #category : #tests }
AddElementTest >> testAtPut [
	|list |
	list := BasicLinkedList new.
	list at: 1 put: 2.
	self assert: (list at:1) equals: 2 .
]

{ #category : #tests }
AddElementTest >> testGetSize [
	| linkedList|
	linkedList:= BasicLinkedList new.
	linkedList addLast: 5.
	self assert: (linkedList getSize) equals: 1.
]

{ #category : #tests }
AddElementTest >> testIsLinkedListEmpty [
	| linkedList result|
	linkedList:= BasicLinkedList new.
	result := linkedList isEmpty .
	self assert: result equals: true.

	
]
