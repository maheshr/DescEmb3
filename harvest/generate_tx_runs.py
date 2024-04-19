import os
import os.path
# example
# transfer_predict.cmd mortality c:\gatech\bd4h\p1\DescEmb3\ehr_codeemb_mimic_mortality_vc.pt VC eicu codeemb

DST_PATH = r"C:\gatech\bd4h\p1\DescEmb3\run_all_transfers.cmd"
XFER_PATH = r"C:\gatech\bd4h\p1\DescEmb3\xfer"


def load_all_xfer_models():
    # get all files in XFER_PATH
    files = os.listdir(XFER_PATH)
    files.sort()
    return files


def write_cmd(models):
    with open(DST_PATH, "w") as f:
        for model in models:
            abs_model = os.path.join(XFER_PATH, model)
            parts = model.split(".")[0].split("_")
            embed_model = parts[1]
            if embed_model == "descemb":
                embed_model = "descemb_bert"
            src_data = "eicu" if parts[2] == "mimic" else "mimiciii"
            value_mode = parts[3].upper()
            task = parts[4]
            if len(parts) == 6:
                task = parts[4] + "_" + parts[5]
            f.write(f"call transfer_predict.cmd {task} {abs_model} {value_mode} {src_data} {embed_model}\n")


def main():
    models = load_all_xfer_models()
    write_cmd(models)
    print(models)


if __name__ == '__main__':
    SystemExit(main())
