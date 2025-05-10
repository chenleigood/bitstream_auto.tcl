# Set the COE file directory
set coe_dir "D:/pqc/bitstream_fault/Bitstream_Fault/BRAM_find_where/COE_FILE_1bit"
# Get all .coe files in the directory
set coe_files [glob "$coe_dir/*.coe"]
# Set the path to the BRAM IP file
set ip_file "D:/pqc/bitstream_fault/Bitstream_Fault/BRAM_find_where/vivado/vivado.srcs/sources_1/ip/bram_12_128/bram_12_128.xci"

# Iterate through each COE file
foreach coe_file $coe_files {
    reset_run synth_1
    reset_run bram_12_128_synth_1
    # Get the filename without the extension
    set base_name [file rootname [file tail $coe_file]]

    # Replace the .coe file for the BRAM IP
    set_property -dict [list CONFIG.Coe_File $coe_file] [get_ips bram_12_128]

    reset_target all [get_files  $ip_file]
    export_ip_user_files -of_objects  [get_files  $ip_file] -sync -no_script -force -quiet

    # Generate the target for the IP
    generate_target all [get_files $ip_file]
    launch_runs synth_1 -jobs 12

    wait_on_run synth_1
    launch_runs impl_1 -to_step write_bitstream -jobs 12
    wait_on_run impl_1
    open_run impl_1
    # Write the bitstream file
    write_bitstream -force "$coe_dir/${base_name}.bit"
}