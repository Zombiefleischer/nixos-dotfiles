{...}:{ 
  programs.zsh = {
    shellAliases = {

    # Normal aliases
    zshconfig = "vim ~/.zshrc";
    apb = "ansible-playbook";
    cat = "bat";
    s = "ssh";
    python = "python3";
    terraform = "tofu";
    lzg = "lazygit";
    lzd = "lazydocker";

    ## Common ansible playbooks
    # Tofu definiton
    atfdefcowor="apb playbooks/tofu.yml -i environments/cowor/inventory";
    atfdefcoinf="apb playbooks/tofu.yml -i environments/coinf/inventory";
    atfdefcswor="apb playbooks/tofu.yml -i environments/cswor/inventory";
    atfdefcomvg="apb playbooks/tofu.yml -i environments/comvg/inventory";
    atfdefcsmvg="apb playbooks/tofu.yml -i environments/csmvg/inventory";
    atfdefcosbx="apb playbooks/tofu.yml -i environments/cosbx/inventory";
    atfdefcopol="apb playbooks/tofu.yml -i environments/copol/inventory";
    atfdefconpa="apb playbooks/tofu.yml -i environments/conpa/inventory";
    atfdefcsnpa="apb playbooks/tofu.yml -i environments/csnpa/inventory";

    # Deploy users
    adepuser = "apb playbooks/deploy/deploy_user.yml";
    # Deploy promtail
    adepprom = "apb playbooks/deploy/deploy_promtail.yml";
    # Deploy alloy
    adepalloy = "apb playbooks/deploy/deploy_alloy.yml";

    # Patch low risk
    alowriskcowor="apb playbooks/patch/patch_low_risk_machines.yml -i environments/cowor/inventory";
    alowriskcoinf="apb playbooks/patch/patch_low_risk_machines.yml -i environments/coinf/inventory";
    alowriskcswor="apb playbooks/patch/patch_low_risk_machines.yml -i environments/cswor/inventory";
    alowriskcomvg="apb playbooks/patch/patch_low_risk_machines.yml -i environments/comvg/inventory";
    alowriskcsmvg="apb playbooks/patch/patch_low_risk_machines.yml -i environments/csmvg/inventory";
    alowriskcosbx="apb playbooks/patch/patch_low_risk_machines.yml -i environments/cosbx/inventory";
    alowriskcopol="apb playbooks/patch/patch_low_risk_machines.yml -i environments/copol/inventory";
    alowriskconpa="apb playbooks/patch/patch_low_risk_machines.yml -i environments/conpa/inventory";
    alowriskcsnpa="apb playbooks/patch/patch_low_risk_machines.yml -i environments/csnpa/inventory";

    # Patch medium risk
    amedriskcowor="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/cowor/inventory";
    amedriskcoinf="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/coinf/inventory";
    amedriskcswor="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/cswor/inventory";
    amedriskcomvg="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/comvg/inventory";
    amedriskcsmvg="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/csmvg/inventory";
    amedriskcosbx="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/cosbx/inventory";
    amedriskcopol="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/copol/inventory";
    amedriskconpa="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/conpa/inventory";
    amedriskcsnpa="apb playbooks/patch/patch_medium_risk_machines.yml -i environments/csnpa/inventory";

    # Create jira tickets
    ajiracowor="apb playbooks/jira/generate_patch_tickets.yml -i environments/cowor/inventory";
    ajiracoinf="apb playbooks/jira/generate_patch_tickets.yml -i environments/coinf/inventory";
    ajiracswor="apb playbooks/jira/generate_patch_tickets.yml -i environments/cswor/inventory";
    ajiracomvg="apb playbooks/jira/generate_patch_tickets.yml -i environments/comvg/inventory";
    ajiracsmvg="apb playbooks/jira/generate_patch_tickets.yml -i environments/csmvg/inventory";
    ajiracosbx="apb playbooks/jira/generate_patch_tickets.yml -i environments/cosbx/inventory";
    ajiracopol="apb playbooks/jira/generate_patch_tickets.yml -i environments/copol/inventory";
    ajiraconpa="apb playbooks/jira/generate_patch_tickets.yml -i environments/conpa/inventory";
    ajiracsnpa="apb playbooks/jira/generate_patch_tickets.yml -i environments/csnpa/inventory";

    # Neovim
    vim = "nvim";

    # Add color to iproute command
    ip = "ip -c";
  };
  
  shellGlobalAliases = {
    # Enable bat colored help pages
    "-- --help" = "--help 2>&1 | bat --language=help --style=plain";
  };
  };
}
