clang-format --style=google --dump-config > .clang-format
sed -i "s/\(ColumnLimit:\s\+\)80/\1100/" .clang-format
sed -i "s/\(ColumnLimit:\s\+\)80/\1100/" .clang-format
sed -i "s/\(SeparateDefinitionBlocks:\s\+\)Leave/\1Always/" .clang-format
