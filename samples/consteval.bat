@echo off
del consteval_test.luac
cd ..
lua LasmCompiler51.lua -o samples\consteval_test.luac samples\consteval_test.lasm
lua samples\consteval.lua samples\consteval_test.luac
lua Decompiler51.lua samples\consteval_test.luac
cd samples
echo Output:
lua consteval_test.luac