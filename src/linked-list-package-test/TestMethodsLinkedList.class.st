Class {
	#name : #TestMethodsLinkedList,
	#superclass : #TestCase,
	#instVars : [
		'samplelist'
	],
	#category : #'linked-list-package-test'
}

{ #category : #running }
TestMethodsLinkedList >> setUp [
   super setUp. 
   samplelist := BasicLinkedList new.
]

{ #category : #tests }
TestMethodsLinkedList >> testAddElement [
   "test case to add element"
   | linkedList | 
	linkedList := BasicLinkedList new.
   linkedList addLast: 5.
   self assert: linkedList size equals: 1.
   self assert: linkedList first equals: 5. 

]

{ #category : #tests }
TestMethodsLinkedList >> testAt [
	| list |
	list := BasicLinkedList  new.
	list addLast: 2.
	self assert: (list at:1) equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testAtPut [
	|list |
	list := BasicLinkedList new.
	self assert: (list at:1 put:2) equals: 2 .
]

{ #category : #tests }
TestMethodsLinkedList >> testCollect [
	| linkedList upadated |
	linkedList := BasicLinkedList new.
	linkedList addLast: 1.
	linkedList addLast: 2.
	
	upadated := linkedList collect: [ :each | each * 4 ].
	
	self assert: upadated first equals: 2.
	self assert: upadated size equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testDetection [
	| list result |
	list := BasicLinkedList new.
	list addLast: 2 .
	list addLast: 3.
	list addLast: 4.
	result := list detect: [ :each | each value even ].
	self assert: result value equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testDo [
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
TestMethodsLinkedList >> testEmpty [
	| list node1|
	list := BasicLinkedList new.
	node1 := BasicLink new.
	node1 value:1.
	list addLast: node1.
	self assert: list isEmpty equals: false.
]

{ #category : #tests }
TestMethodsLinkedList >> testFirst [
	| list "node1"  |
	list := BasicLinkedList new.
	list addLast: 2.
	
	self assert: list first equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testGetSize [
	| linkedList|
	linkedList:= BasicLinkedList new.
	linkedList addLast: 5.
	self assert: (linkedList size) equals: 1.
]

{ #category : #tests }
TestMethodsLinkedList >> testIsLinkedListEmpty [
	| linkedList result|
	linkedList:= BasicLinkedList new.
	result := linkedList isEmpty .
	self assert: result equals: true.

	
]

{ #category : #tests }
TestMethodsLinkedList >> testReject [
	| list result|
	list := BasicLinkedList new.
	list addLast: 2 .
	list addLast: 3.
	list addLast: 4.
	result := list reject: [ :each | each value even ].
	self assert: result value equals: 3.
]

{ #category : #tests }
TestMethodsLinkedList >> testRemove [
	|list |
	list := BasicLinkedList  new.
	list addLast: 2.
	list addLast: 3.
	
	list remove: 2.
	self assert: list first equals: 3 .
]

{ #category : #tests }
TestMethodsLinkedList >> testRemoveAt [
	|list |
	list := BasicLinkedList new.
	list addLast: 2.
	list removeAt: 1.
	self assert: list first equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testSelect [
	| list result node|
	list := BasicLinkedList  new.
	node:= BasicLink new.
	node value: 2.
	list addLast: node.
	result := list select: [ :each | each value even ].
	self assert: result value equals: 2.
]

{ #category : #tests }
TestMethodsLinkedList >> testSort [
	|list  |
	list := BasicLinkedList  new.
	list addLast: 2.
	list addLast: 3.
	
	self assert: list sort equals: true.
]

{ #category : #tests }
TestMethodsLinkedList >> testSorted [
	|list  |
	list := BasicLinkedList new.

	list addLast: 3.
	list addLast: 2.
	
	self assert: list sorted equals: true.
]
