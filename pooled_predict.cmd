@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

set LABEL=%1
set EVAL_DATA=%2

REM python main.py --input_path %DST_PATH% --model ehr_model --embed_model descemb_bert --pred_model rnn --src_data pooled --eval_data %EVAL_DATA% --ratio 100 --value_mode DSVA --task %LABEL% --batch_size 64
python main.py --input_path %DST_PATH% --model ehr_model --embed_model codeemb --pred_model rnn --src_data pooled --eval_data %EVAL_DATA% --ratio 100 --value_mode VC --task %LABEL% --batch_size 64
