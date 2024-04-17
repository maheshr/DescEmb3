@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

python main.py --input_path C:\gatech\bd4h\p1\d_out --task w2v --model codeemb --value_mode VC --src_data mimiciii --ratio 100 --n_epochs 1000