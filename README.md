# efs_backed_conda

## Installation steps

1. Build the docker image and push to ECR. Attach the docker image to the SageMaker Studio Domain. You can use the AWS Console or the command line as described below:

```bash
 aws sagemaker create-image --image-name conda-efs --role-arn <Role> --display-name "Conda with EFS backed env"
 aws sagemaker create-image-version --base-image <image ECR ARN> --image-name conda-efs
 aws sagemaker create-app-image-config --cli-input-json file://app-image-config-input.json
 aws sagemaker update-domain --cli-input-json file://update-domain.json
 ```

3. From Studio use the Image terminal of the **datascience** first-party kernel image and create the conda environment in the following way:

```bash
mkdir -p ~/.conda/envs
conda create -p ~/.conda/envs/custom
conda activate custom
conda install scikit-learn numpy ipykernel
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



