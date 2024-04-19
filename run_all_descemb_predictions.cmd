@echo off
set DST_PATH=C:\gatech\bd4h\p1\d_out

REM call descemb_labels.cmd descemb_eicu_vc.pt VC eicu
REM call descemb_labels.cmd descemb_eicu_va.pt VA eicu
REM call descemb_labels.cmd descemb_eicu_dsva.pt DSVA eicu
REM call descemb_labels.cmd descemb_eicu_dsva_dpe.pt DSVA_DPE eicu

REM call descemb_labels.cmd descemb_mimic_vc.pt VC mimiciii
call descemb_labels.cmd descemb_mimic_va.pt VA mimiciii
REM call descemb_labels.cmd descemb_mimic_dsva.pt DSVA mimiciii
call descemb_labels.cmd descemb_mimic_dsva_dpe.pt DSVA_DPE mimiciii
