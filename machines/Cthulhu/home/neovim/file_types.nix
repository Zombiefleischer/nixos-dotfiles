{
  programs.nixvim = {
    files."ftdetect/terraformft.lua".autoCmd = [
      {
        group = "filetypes";
        event = ["BufRead" "BufNewFile"];
        pattern = ["*.tf" " *.tfvars" " *.hcl"];
        command = "set ft=terraform";
      }
    ];

    # files."ftdetect/yaml.ansible.lua".autoCmd = [

    # ]
  };
}
