import shutil
import sys
import os
import os.path
import yaml
import os
import pathlib


def process_logs(run):
    valid_run = False

    # load yaml file
    with open(run + "/.config/config.yaml", "r") as f:
        config = yaml.load(f, Loader=yaml.FullLoader)
        model = config["model"]
        embed_model = config["embed_model"]
        pred_model = config["pred_model"]
        task = config["task"]
        value_mode = config["value_mode"]
        src_data = config["src_data"]
        eval_data = config["eval_data"]
        transfer = config["transfer"]

    if src_data != 'pooled':
        return

    if transfer:
        return

    # load train.log file
    with open(run + "/train.log", "r") as f:
        train_prc = None
        valid_prc = None
        test_prc = None
        candidate_train_prc = None
        candidate_test_prc = None
        candidate_valid_prc = None
        for line in f:
            if "[train]" in line:
                candidate_train_prc = line.split(" ")[-1].strip()
            if "[test]" in line:
                candidate_test_prc = line.split(" ")[-1].strip()
            if "[valid]" in line:
                candidate_valid_prc = line.split(" ")[-1].strip()
            if "Saving" in line:
                train_prc = candidate_train_prc
                test_prc = candidate_test_prc
                valid_prc = candidate_valid_prc
            if "done training" in line:
                valid_run = True
    if valid_run:
        print(model, embed_model, pred_model, src_data, task, value_mode, train_prc, valid_prc, test_prc)

        new_name = f"{model}_{embed_model}_{src_data}_{eval_data}_{task}_{value_mode.lower()}"
        dst_folder = pathlib.Path(run)
        dst_folder = dst_folder.parent
        dst_folder = os.path.join(dst_folder, new_name)
        print(dst_folder)
        if not os.path.exists(dst_folder):
            os.rename(run, dst_folder)

        # rename the model
        # new_name = f"ehr_{embed_model.replace('_bert', '')}_{src_data.replace('iii', '')}_{value_mode.lower()}_{task}.pt"
        # print(new_name)

        # src_path = os.path.join(run, "checkpoints", "checkpoint_best.pt")
        # dest_path = r"C:\gatech\bd4h\p1\DescEmb3\xfer"
        # dest_path = os.path.join(dest_path, new_name)
        # copy file
        # shutil.copy(src_path, dest_path)

        # dst_folder = pathlib.Path(run)
        # dst_folder = dst_folder.parent
        # dst_folder = os.path.join(dst_folder, new_name).replace(".pt", "")
        # if not os.path.exists(dst_folder):
        #     os.rename(run, dst_folder)
    else:
        dst = run + "_bad"
        if not os.path.exists(dst):
            os.rename(run, dst)


def process(folder):
    # check if folder exists
    if not os.path.exists(folder):
        raise RuntimeError("Folder does not exist")

    # get all folders in the folder
    runs = [f for f in os.listdir(folder) if os.path.isdir(os.path.join(folder, f))]
    runs = [os.path.join(folder, run) for run in runs]

    for run in runs:
        process_logs(run)


def main(outputs_folder):
    # date_folders = os.listdir(outputs_folder)
    # for arg in date_folders:
    #     process(os.path.join(outputs_folder, arg))
    process(outputs_folder)


if __name__ == '__main__':
    main(r"C:\gatech\bd4h\p1\pool_results")