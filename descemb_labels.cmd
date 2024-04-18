@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

set MODEL_PATH=c:\gatech\bd4h\p1\DescEmb3\%1
set VALUE_MODE=%2
set DATA=%3

call descemb_predict.cmd mortality %MODEL_PATH% %VALUE_MODE% %DATA%
call descemb_predict.cmd los_3day %MODEL_PATH% %VALUE_MODE% %DATA%
call descemb_predict.cmd los_7day %MODEL_PATH% %VALUE_MODE% %DATA%
call descemb_predict.cmd readmission %MODEL_PATH% %VALUE_MODE% %DATA%
