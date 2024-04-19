@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

set EVAL_DATA=%1

call pooled_predict.cmd mortality %EVAL_DATA%
call pooled_predict.cmd los_3day %EVAL_DATA%
call pooled_predict.cmd los_7day %EVAL_DATA%
call pooled_predict.cmd readmission %EVAL_DATA%
