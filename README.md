# Oyster Card
A program that allows users to utilise an oystercard to travel on TfL's transportation system.

## Installation
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## Features
* Touch in and out of stations
* Record a journey log
* Top up money onto the card
* Deducting fare and penalty fares based on touching in and out

## User stories

Here are the user stories you will be working on for this project:

```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

## Tests
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```