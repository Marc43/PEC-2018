sisa-as "$1.s" -o "$1.o";
sisa-objdump -d "$1.o" | awk '{ print $2 }' | tail -n +7 | cat > "$1.hex";
