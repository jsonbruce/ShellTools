#!/bin/bash

NODES="node10 node20 node50 node60 node70 node80 node90 node120 node130"

for node in $NODES;
do 
	expect ssh-copy-id-with-expect.exp $node
done