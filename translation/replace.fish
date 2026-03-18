#!/usr/bin/env fish

set -l file "../src/Compilers/CSharp/Portable/Syntax/SyntaxKindFacts.cs"

set -l keywords $(cat keywords.txt)
set -l translated $(cat translated_keywords_sanitized.txt)

for i in $(seq 1 $(count $keywords))
    sed -i "s|\"$keywords[$i]\"|\"$translated[$i]\"|g" $file
end