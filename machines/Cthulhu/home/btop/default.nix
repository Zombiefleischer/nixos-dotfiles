{...}:{
  
  programs.btop = {
    enable = true;

    settings = {
      #* If the theme set background should be shown, set to False if you want terminal background transparency.
      theme_background = false;

      #* Sets if 24-bit truecolor should be used, will convert 24-bit colors to 256 color (6x6x6 color cube) if false.
      truecolor = true;

      #* Set to true to force tty mode regardless if a real tty has been detected or not.
      #* Will force 16-color mode and TTY theme, set all graph symbols to "tty" and swap out other non tty friendly symbols.
      force_tty = false;

      #* Define presets for the layout of the boxes. Preset 0 is always all boxes shown with defaultsettings. Max 9 presets.
      #* Format: "box_name:P:G,box_name:P:G" P=(0 or 1) for alternate positions, G=graph symbol to use for box.
      #* Use whitespace " " as separator between different presets.
      #* Example: "cpu:0:default,mem:0:tty,proc:1:default cpu:0:braille,proc:0:tty"
      presets = "cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty";

      #* Set to True to enable "h,j,k,l,g,G" keys for directional control in lists.
      #* Conflicting keys for h:"help" and k:"kill" is accessible while holding shift.
      vim_keys = true;

      #* Rounded corners on boxes, is ignored if TTY mode is ON.
      rounded_corners = true;

      #* Default symbols to use for graph creation, "braille", "block" or "tty".
      #* "braille" offers the highest resolution but might not be included in all fonts.
      #* "block" has half the resolution of braille but uses more common characters.
      #* "tty" uses only 3 different symbols but will work with most fonts and should work in a realTTY.
      #* Note that "tty" only has half the horizontal resolution of the other two, so will show a shorter historical view.
      graph_symbol = "braille";

      # Graph symbol to use for graphs in cpu box, "default", "braille", "block" or "tty".
      graph_symbol_cpu = "default";

      # Graph symbol to use for graphs in gpu box, "default", "braille", "block" or "tty".
      graph_symbol_gpu = "default";

      # Graph symbol to use for graphs in cpu box, "default", "braille", "block" or "tty".
      graph_symbol_mem = "default";

      # Graph symbol to use for graphs in cpu box, "default", "braille", "block" or "tty".
      graph_symbol_net = "default";

      # Graph symbol to use for graphs in cpu box, "default", "braille", "block" or "tty".
      graph_symbol_proc = "default";

      #* Manually set which boxes to show. Available values are "cpu mem net proc" and "gpu0" through "gpu5", separate values with whitespace.
      shown_boxes = "mem net proc cpu";

      #* Update time in milliseconds, recommended 2000 ms or above for better sample times for graphs.
      update_ms = 100;

      #* Processes sorting, "pid" "program" "arguments" "threads" "user" "memory" "cpu lazy" "cpu direct",
      #* "cpu lazy" sorts top process over time (easier to follow), "cpu direct" updates top processdirectly.
      proc_sorting = "memory";

      #* Reverse sorting order, True or False.
      proc_reversed = false;
      
      #* Show processes as a tree.
      proc_tree = false;
      
      #* Use the cpu graph colors in the process list.
      proc_colors = true;
      
      #* Use a darkening gradient in the process list.
      proc_gradient = true;
      
      #* If process cpu usage should be of the core it's running on or usage of the total available cpu power.
      proc_per_core = false;
      
      #* Show process memory as bytes instead of percent.
      proc_mem_bytes = true;
      
      #* Show cpu graph for each process.
      proc_cpu_graphs = true;
      
      #* Use /proc/[pid]/smaps for memory information in the process info box (very slow but more accurate)
      proc_info_smaps = false;
      
      #* Show proc box on left side of screen instead of right.
      proc_left = false;
      
      #* (Linux) Filter processes tied to the Linux kernel(similar behavior to htop).
      proc_filter_kernel = false;
      
      #* In tree-view, always accumulate child process resources in the parent process.
      proc_aggregate = false;
      
      #* Sets the CPU stat shown in upper half of the CPU graph, "total" is always available.
      #* Select from a list of detected attributes from the options menu.
      cpu_graph_upper = "total";
      
      #* Sets the CPU stat shown in lower half of the CPU graph, "total" is always available.
      #* Select from a list of detected attributes from the options menu.
      cpu_graph_lower = "total";
      
      #* If gpu info should be shown in the cpu box. Available values = "Auto", "On" and "Off".
      show_gpu_info = "Auto";

      #* Example: "/mnt/media:100 /:20 /boot:1".
      io_graph_speeds = "";
      
      #* Set fixed values for network graphs in Mebibits. Is only used if net_auto is also set to False.
      net_download = 100;
      
      net_upload = 100;
      
      #* Use network graphs auto rescaling mode, ignores any values set above and rescales down to 10 Kibibytes at the lowest.
      net_auto = true;
      
      #* Sync the auto scaling for download and upload to whichever currently has the highest scale.
      net_sync = true;
      
      #* Starts with the Network Interface specified here.
      net_iface = "";
      
      #* Show battery stats in top right if battery is present.
      show_battery = true;
      
      #* Which battery to use if multiple are present. "Auto" for auto detection.
      selected_battery = "Auto";
      
      #* Show power stats of battery next to charge indicator.
      show_battery_watts = true;
      
      #* Set loglevel for "~/.config/btop/btop.log" levels are: "ERROR" "WARNING" "INFO" "DEBUG".
      #* The level set includes all lower levels, i.e. "DEBUG" will show all logging info.
      log_level = "WARNING";
      
      #* Measure PCIe throughput on NVIDIA cards, may impact performance on certain cards.
      nvml_measure_pcie_speeds = true;
      
      #* Horizontally mirror the GPU graph.
      gpu_mirror_graph = true;
      
      #* Custom gpu0 model name, empty string to disable.
      custom_gpu_name0 = "";
      
      #* Custom gpu1 model name, empty string to disable.
      custom_gpu_name1 = "";
      
      #* Custom gpu2 model name, empty string to disable.
      custom_gpu_name2 = "";
      
      #* Custom gpu3 model name, empty string to disable.
      custom_gpu_name3 = "";
      
      #* Custom gpu4 model name, empty string to disable.
      custom_gpu_name4 = "";
      
      #* Custom gpu5 model name, empty string to disable.
      custom_gpu_name5 = "";
    };

    catppuccin = {
      enable = true;
      flavor = "mocha";
    };
  };
}
