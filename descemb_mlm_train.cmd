@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

set VALUE_MODE=%1
echo VALUE_MODE=%VALUE_MODE%
set SRC_DATA=%2
echo SRC_DATA=%SRC_DATA%
python main.py --input_path %DST_PATH% --task mlm --model descemb_bert --value_mode %VALUE_MODE% --src_data %SRC_DATA% --ratio 100 --n_epochs 100
