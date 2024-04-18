@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

REM get the first parameter
set VALUE_MODE=%1
echo VALUE_MODE=%VALUE_MODE%
set SRC_DATA=%2
echo SRC_DATA=%SRC_DATA%

set NUMEXPR_MAX_THREADS=1

python main.py --input_path C:\gatech\bd4h\p1\d_out --task w2v --model codeemb --value_mode %VALUE_MODE% --src_data %SRC_DATA% --ratio 100 --n_epochs 1000