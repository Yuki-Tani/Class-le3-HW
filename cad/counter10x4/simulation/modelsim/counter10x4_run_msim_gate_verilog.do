transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {counter10x4_7_1200mv_100c_slow.vo}

vlog -vlog01compat -work work +incdir+/home/015/a0151390/le3/HW/cad/counter10x4/simulation/modelsim {/home/015/a0151390/le3/HW/cad/counter10x4/simulation/modelsim/counter10x4_test1.vt}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  counter10x4_vlg_tst

add wave *
view structure
view signals
run -all
