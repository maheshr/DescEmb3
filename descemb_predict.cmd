@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

set LABEL=%1
set MODEL_PATH=%2
set VALUE_MODE=%3
set DATA=%4

python main.py --input_path %DST_PATH% --model ehr_model --embed_model descemb_bert --pred_model rnn --src_data %DATA% --ratio 100 --value_mode %VALUE_MODE% --task %LABEL% --load_pretrained_weights --model_path %MODEL_PATH%