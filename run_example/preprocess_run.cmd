@echo off
set SRC_PATH=C:\gatech\bd4h\p1\d_inp
set DST_PATH=C:\gatech\bd4h\p1\d_out

python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type pretrain --value_mode VC
python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type pretrain --value_mode VA
python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type pretrain --value_mode DSVA

python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type predict --value_mode VC
python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type predict --value_mode VA
python ../preprocess/preprocess_main.py --src_data mimiciii --dataset_path %SRC_PATH%\mimiciii --dest_path %DST_PATH% --data_type predict --value_mode DSVA

REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type pretrain --value_mode VC
REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type pretrain --value_mode VA
REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type pretrain --value_mode DSVA

REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type predict --value_mode VC
REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type predict --value_mode VA
REM python ../preprocess/preprocess_main.py --src_data eicu --dataset_path %SRC_PATH%\eicu --dest_path %DST_PATH% --data_type predict --value_mode DSVA

REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type predict --value_mode VC
REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type pretrain --value_mode VC
REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type predict --value_mode VA
REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type pretrain --value_mode VA
REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type predict --value_mode DSVA
REM python ../preprocess/preprocess_main.py --src_data pooled --dataset_path %SRC_PATH%\ --dest_path %DST_PATH% --data_type pretrain --value_mode DSVA
