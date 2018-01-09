#!/bin/bash
echo "# 테스트를 수행 할 디스크에서 실행 합니다."
echo ""
echo "# 1GB 연속 쓰기 테스트 (스루풋)"
echo "dd if=/dev/zero bs=1G count=1 of=write_1GB_test"
dd if=/dev/zero bs=1G count=1 of=write_1GB_test

echo ""
echo ""
echo "# 1MB씩 1024회 쓰기 테스트 (레이턴시)"
echo "dd if=/dev/zero bs=1M count=1024 of=write_1GB_test"
dd if=/dev/zero bs=1M count=1024 of=write_1GB_test
echo ""
