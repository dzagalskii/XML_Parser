#!/bin/bash
for filename in $(find test/*.xml)
do
	./xml_parser $filename
done
