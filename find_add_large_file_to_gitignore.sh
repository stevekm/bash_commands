#!/bin/bash

find . -size +1M -type f | cat >> .gitignore
