@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out
set ROOT_PATH=c:\gatech\bd4h\p1\DescEmb3

python main.py --input_path %DST_PATH% --model ehr_model --embed_model descemb_bert --pred_model rnn --src_data mimiciii --ratio 100 --value_mode VC --task readmission --load_pretrained_weights --model_path %ROOT_PATH%\descemb_mimic_vc.pt
