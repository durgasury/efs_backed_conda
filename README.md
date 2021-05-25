# efs_backed_conda

## Installation steps

1. Build the docker image and push to ECR. Attach the docker image to the SageMaker Studio Domain 

3. From Studio use the Image terminal of the **datascience** first-party kernel image and create the conda environment in the following way:

```bash
mkdir -p ~/.conda/envs
conda create -p ~/.conda/envs/custom
```

Also create a **.condarc** file on the EFS volume with the following content:

```
envs_dirs:
  - ~/.conda/envs
```

3. Create a notebook with the custom EFS backed conda image.

4. For installing packages permanently on EFS, use the image terminal of the custom image. You can install packages like in the example below:

```bash
conda activate custom
conda install seaborn pyarrow
```



