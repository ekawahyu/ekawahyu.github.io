#!/bin/bash

rm -r tag
jekyll build
cp -r _site/tag .
jekyll serve
