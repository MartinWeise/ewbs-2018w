all: network1

seminar1:
	./dlv -silent project/seminar_test1.dl project/seminar_guess.dl project/seminar_check.dl -filter=reserved

seminar2:
	./dlv -silent project/seminar_test2.dl project/seminar_guess.dl project/seminar_check.dl -pfilter=reserved

seminar3:
	./dlv -silent project/seminar_test3.dl project/seminar_guess.dl project/seminar_check.dl -pfilter=reserved

seminar4:
	./dlv -silent project/seminar_test4.dl project/seminar_guess.dl project/seminar_check.dl -pfilter=reserved

seminar5:
	./dlv -silent project/seminar_test5.dl project/seminar_guess.dl project/seminar_check.dl -pfilter=reserved

network1:
	./dlv -N=2 project/network.dl project/network_test1.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network2:
	./dlv -N=2 project/network.dl project/network_test2.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network3:
	./dlv -N=2 project/network.dl project/network_test3.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network4:
	./dlv -N=2 project/network.dl project/network_test4.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network5:
	./dlv -N=2 project/network.dl project/network_test5.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network6:
	./dlv -N=2 project/network.dl project/network_test6.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network7:
	./dlv -N=2 project/network.dl project/network_test7.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network8:
	./dlv -N=2 project/network.dl project/network_test8.dl project/test_network.dl -filter=d4,d5,UNCOMPUTED_d4,UNCOMPUTED_d5,UNEXPECTED_d4,UNEXPECTED_d5,DUPLICATED_d4,DUPLICATED_d5

network6-cbd:
	./dlv -N=2 -FRmin -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/network_test6.obs

network-cbd:
	./dlv -N=2 -FRmin -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/cbd_fault.obs project/cbd_fault_m1_ok.obs
	./dlv -N=2 -FRsingle -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/cbd_fault.obs project/cbd_fault_m1_ok.obs
	./dlv -N=2 -FR -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/cbd_fault.obs project/cbd_fault_m1_ok.obs

network-fault-c1-ab:
	./dlv -N=2 -FRsingle -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/cbd_fault.obs project/cbd_fault_c1_ab.obs

network-fault-m1m2-ab:
	./dlv -N=2 -FRmin -silent project/network.dl project/cbd.hyp project/cbd_cstr.dl project/cbd_fault.obs project/cbd_fault_m1m2_ab.obs

network-abd:
	./dlv -N=2 -FD -silent project/abd_network.dl project/abd.hyp project/abd_cstr.dl project/abd_fault.dl project/abd_fault.obs

network-abd-m1-wary:
	./dlv -N=2 -FD -silent project/abd_network.dl project/abd.hyp project/abd_cstr.dl project/abd_fault.dl project/abd_fault_m1_wary.obs

network-abd-empty:
	./dlv -N=2 -FD -silent project/abd_network.dl project/abd.hyp project/abd_cstr.dl project/abd_fault.dl project/abd_fault_empty.obs

zip-check:
	./file_exists.sh
	
#zip -j ../01429167_project.zip seminar_test1.dl seminar_test2.dl seminar_test3.dl seminar_test4.dl seminar_test5.dl seminar_guess.dl seminar_check.dl network_test1.dl network_test2.dl network_test3.dl network_test4.dl network_test5.dl network_test6.dl network_test7.dl network_test8.dl test_network.dl network.dl cbd.hyp cbd_cstr.dl cbd_fault.obs cbd_fault_m1_ok.obs cbd_fault_c1_ab.obs cbd_fault_m1m2_ab.obs abd.hyp abd_cstr.dl abd_network.dl abd_fault.dl abd_fault.obs abd_fault_m1_wary.obs abd_fault_empty.obs
	