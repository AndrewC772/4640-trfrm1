
Terraform must be installed before this can be run. 
Installation Instruction: https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

1. Create a .env file containing your TER_VAR_do_token which would be the api key.
    example: export TF_VAR_do_token=<api key here>
2. Once that is done you can do a source .env to set the environment variable
3. echo $TF_VAR_do_token should show the value set in the .env file if done correctly
4. do a "terraform.init" in the main project folder.
5. "terraform apply" and the resources should be created.

below is no longer the case as i'm not sure that is what i should've submit for the lab. Changed the key name to River and created a new project called 4640_labs
<!-- 2. The keyname is currently set to 4640_Lab this can be changed in the data block with "digitalocean_ssh_key" to whatever is required
3. instead of the Project being named 4640_labs mine is named BCIT_4640 as i had created this Project previously -->