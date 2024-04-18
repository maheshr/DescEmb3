@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

call codeemb_labels.cmd codeemb_eicu_vc.pt VC eicu
call codeemb_labels.cmd codeemb_eicu_va.pt VA eicu
call codeemb_labels.cmd codeemb_eicu_dsva.pt DSVA eicu

call codeemb_labels.cmd codeemb_mimic_vc.pt VC mimiciii
call codeemb_labels.cmd codeemb_mimic_va.pt VA mimiciii
call codeemb_labels.cmd codeemb_mimic_dsva.pt DSVA mimiciii
