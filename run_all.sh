#!/usr/bin/env bash
# Збирання і всі заміри для Lab 2 (крім енергії, її міряємо через HWiNFO).
# Використання: ./run_all.sh [N]   (за замовчуванням N=2048)
set -e

N=${1:-2048}
FG=${FLAMEGRAPH_DIR:-$HOME/FlameGraph}

echo "=== Компіляція ==="
gcc -O0 -g -fno-omit-frame-pointer matmul.c -o matmul_O0
gcc -O3 -march=native -g -fno-omit-frame-pointer matmul.c -o matmul_O3
gcc -O0 -S -masm=intel matmul.c -o matmul_O0.s
gcc -O3 -march=native -S -masm=intel matmul.c -o matmul_O3.s

for v in O0 O3; do
    echo
    echo "=== $v: /usr/bin/time --verbose ==="
    /usr/bin/time --verbose ./matmul_$v "$N" 2>&1 | tee time_$v.txt

    echo
    echo "=== $v: perf stat -d ==="
    perf stat -d ./matmul_$v "$N" 2>&1 | tee stat_$v.txt

    echo
    echo "=== $v: perf record + FlameGraph ==="
    perf record -e cpu-clock -F 999 -g -o perf_$v.data ./matmul_$v "$N"
    perf script -i perf_$v.data > out_$v.perf
    "$FG/stackcollapse-perf.pl" out_$v.perf > out_$v.folded
    "$FG/flamegraph.pl" --title "matmul $v (N=$N)" out_$v.folded > flame_$v.svg

    echo
    echo "=== $v: perf report ==="
    perf report -i perf_$v.data --stdio --no-children --sort symbol 2>&1 | tee report_$v.txt | head -30
done

echo
echo "=== perf annotate ==="
perf annotate -i perf_O0.data --stdio -M intel multiply > annotate_O0.txt 2>/dev/null || true
perf annotate -i perf_O3.data --stdio -M intel main > annotate_O3.txt 2>/dev/null || true

echo
echo "=== AVX-інструкції ==="
echo "ymm у O0: $(grep -c ymm matmul_O0.s || true)"
grep -E "vfmadd|vbroadcast" matmul_O3.s | head -5

echo
echo "Готово. Графіки: flame_O0.svg, flame_O3.svg"
