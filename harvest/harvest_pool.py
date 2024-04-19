import shutil
import sys
import os
import os.path
import yaml
import os


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
        transfer = config["transfer"]
        model_path = config["model_path"]
        eval_data = config["eval_data"]

    if model != 'ehr_model':
        return

    assert eval_data is not None
    assert src_data == 'pooled'

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
        print(run, model, embed_model, pred_model, src_data, eval_data, task, value_mode, test_prc)


def process(folder):
    # check if folder exists
    if not os.path.exists(folder):
        raise RuntimeError("Folder does not exist")

    # get all folders in the folder
    runs = [f for f in os.listdir(folder) if os.path.isdir(os.path.join(folder, f))]
    runs = [os.path.join(folder, run) for run in runs]

    for run in runs:
        process_logs(run)


def main(args):
    for arg in args:
        process(arg)


if __name__ == '__main__':
    main(sys.argv[1:])
