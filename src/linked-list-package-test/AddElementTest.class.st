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
	self assert: (list at:1 put:2) equals: 2 .
]

{ #category : #tests }
AddElementTest >> testCollect [
	| list upadated |
	list := BasicLinkedList new.
	list addLast: 1.
	list addLast: 2.
	
	upadated := list collect: [ :each | each * 4 ].
	
	self assert: upadated first equals: 2.
	self assert: upadated size equals: 2.
]

{ #category : #tests }
AddElementTest >> testDetection [
	| list result |
	list := BasicLinkedList new.
	list addLast: 2.
	list addLast: 3.
	result := list detect: [ :each | each value even ].
	self assert: result value equals: 2.
]

{ #category : #tests }
AddElementTest >> testDo [
	| list sum |
	list := BasicLinkedList new.
	sum := 2.
	list addLast: 2 .
	list addLast: 3.
	
	list do: [ :each |
		self assert: each value equals: sum.
		sum := sum + 1 ]
]

{ #category : #tests }
AddElementTest >> testEmpty [
	| list node1|
	list := BasicLinkedList new.
	node1 := BasicLink new.
	node1 value:1.
	list addLast: node1.
	self assert: list isEmpty equals: false.
]

{ #category : #tests }
AddElementTest >> testFirst [
	| list "node1"  |
	list := BasicLinkedList new.
	list addLast: 2.
	
	self assert: list first equals: 2.
]

{ #category : #tests }
AddElementTest >> testGetSize [
	| linkedList|
	linkedList:= BasicLinkedList new.
	linkedList addLast: 5.
	self assert: (linkedList getSize) equals: 1.
]

{ #category : #tests }
AddElementTest >> testInjectinto [
	| list result |
	list := BasicLinkedList  new.
	list addLast: 1.
	list addLast: 2.
	list addLast: 3.
	result := list inject: [:sum :each | sum + each ] into: 0.
	self assert: result first equals: 10.
]

{ #category : #tests }
AddElementTest >> testIsLinkedListEmpty [
	| linkedList result|
	linkedList:= BasicLinkedList new.
	result := linkedList isEmpty .
	self assert: result equals: true.

	
]

{ #category : #tests }
AddElementTest >> testReject [
	| list result|
	list := BasicLinkedList new.
	list addLast: 2 .
	list addLast: 3.
	list addLast: 4.
	result := list reject: [ :each | each data even ].
	self assert: result data equals: 3.
]

{ #category : #tests }
AddElementTest >> testRemove [
	|list |
	list := BasicLinkedList  new.
	list addLast: 2.
	list addLast: 3.
	
	list remove: 2.
	self assert: list first equals: 3 .
]

{ #category : #tests }
AddElementTest >> testRemoveAt [
	|list |
	list := BasicLinkedList new.
	list addLast: 2.
	list addLast: 3.
	
	list removeAt: 1.
	self assert: list first equals: 2.
]

{ #category : #tests }
AddElementTest >> testSelect [
	| list result|
	list := BasicLinkedList  new.
	list addLast: 2.
	list addLast: 3.
	list addLast: 4.
	result := list select: [ :each | each data even ].
	self assert: result data equals: 2.
]

{ #category : #tests }
AddElementTest >> testSort [
	|list  |
	list := BasicLinkedList  new.
	list addLast: 2.
	list addLast: 3.
	
	self assert: list sort equals: true.
]

{ #category : #tests }
AddElementTest >> testSorted [
	|list  |
	list := BasicLinkedList new.

	list addLast: 3.
	list addLast: 2.
	
	self assert: list sorted equals: true.
]
