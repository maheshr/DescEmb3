@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

REM Get the first parameter passed in
set LABEL=%1
set MODEL_PATH=%2

python main.py --input_path %DST_PATH% --model ehr_model --embed_model codeemb --pred_model rnn --src_data mimiciii --ratio 100 --value_mode VC --task %LABEL% --load_pretrained_weights --model_path %MODEL_PATH%
